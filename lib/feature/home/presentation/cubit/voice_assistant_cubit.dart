import 'dart:typed_data';
import 'package:basirah/core/utils/constant/enums.dart';
import 'package:basirah/feature/home/domain/usecase/vision_ai_usecase.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
part 'voice_assistant_state.dart';

class VoiceAssistantCubit extends Cubit<VoiceAssistantState> {
  final FlutterTts _tts = FlutterTts();
  final stt.SpeechToText _speech = stt.SpeechToText();
  final VisionAiUseCase visionAiUseCase; 

  CameraController? cameraController;

  VoiceAssistantCubit(this.visionAiUseCase) : super(const VoiceAssistantState()) {
    _init();
  }

  Future<void> _init() async {
    await _initCamera();

    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(0.5);
    await _tts.awaitSpeakCompletion(true);

    _tts.setCompletionHandler(() {
      if (state.status == AssistantStatus.speaking) {
        _startListening();
      }
    });

    await _speech.initialize(
      onStatus: (status) {
        debugPrint('Speech status: $status');
        if (status == 'notListening' || status == 'done') {
          if (state.status == AssistantStatus.listening) {
            _restartListening();
          }
        }
      },
      onError: (error) {
        debugPrint('Speech error: $error');
        if (state.status == AssistantStatus.listening) {
          _restartListening();
        }
      },
    );

    await _speakWelcome();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      final back = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
      cameraController = CameraController(
        back, 
        ResolutionPreset.medium,
        enableAudio: false,
      );
      await cameraController!.initialize();
      emit(state.copyWith(isCameraReady: true));
    } catch (e) {
      debugPrint('Camera init error: $e');
    }
  }

  Future<void> _speakWelcome() async {
    emit(state.copyWith(
      status: AssistantStatus.speaking,
    ));
    await _tts.speak("Hello, point the camera at what is around you and ask me anything anytime");
  }

  Future<void> _startListening() async {
    if (_speech.isListening) return;
    
    emit(state.copyWith(status: AssistantStatus.listening, lastAnswer: null));
    await _speech.listen(
      onResult: (result) {
        if (result.finalResult && result.recognizedWords.isNotEmpty) {
          _onSpeechCaptured(result.recognizedWords);
        }
      },
      localeId: 'en-US',
      listenOptions: stt.SpeechListenOptions(
        cancelOnError: false,
        partialResults: false,
      ),
    );
  }

  Future<void> _restartListening() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (state.status == AssistantStatus.listening && !_speech.isListening) {
      await _startListening();
    }
  }

  Future<void> _onSpeechCaptured(String question) async {
    await _speech.stop();

    if (question.trim().isEmpty) {
      await _startListening();
      return;
    }

    emit(state.copyWith(status: AssistantStatus.processing, lastQuestion: question));
    await _tts.speak("Let me see,checking now");

    if (cameraController == null || !cameraController!.value.isInitialized) {
      await _speakResult('Sorry, camera is not ready.');
      return;
    }

    try {
      final imageFile = await cameraController!.takePicture();
      final Uint8List imageBytes = await imageFile.readAsBytes();

      final result = await visionAiUseCase(
        question: question,
        imageBytes: imageBytes,
      );

      result.fold(
        (failure) async => await _speakResult('Sorry, something went wrong.'),
        (answer) async {
          final cleanedAnswer = _cleanMarkdownText(answer);
          await _speakResult(cleanedAnswer);
        },
      );
    } catch (e) {
      debugPrint('Capture error: $e');
      await _speakResult('Sorry, something went wrong.');
    }
  }

  String _cleanMarkdownText(String text) {
    return text
        .replaceAll(RegExp(r'[\*\#_`-]'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  Future<void> _speakResult(String text) async {
    emit(state.copyWith(status: AssistantStatus.speaking, lastAnswer: text));
    await _tts.speak(text);
  }

  @override
  Future<void> close() {
    _tts.stop();
    _speech.stop();
    cameraController?.dispose();
    return super.close();
  }
}