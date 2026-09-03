part of 'voice_assistant_cubit.dart';

class VoiceAssistantState {
  final AssistantStatus status;
  final String? lastQuestion;
  final String? lastAnswer;
  final bool isCameraReady;

  const VoiceAssistantState({
    this.status = AssistantStatus.speaking,
    this.lastQuestion,
    this.lastAnswer,
    this.isCameraReady = false,
  });

  VoiceAssistantState copyWith({
    AssistantStatus? status,
    String? lastQuestion,
    String? lastAnswer,
    bool? isCameraReady,
  }) {
    return VoiceAssistantState(
      status: status ?? this.status,
      lastQuestion: lastQuestion ?? this.lastQuestion,
      lastAnswer: lastAnswer ?? this.lastAnswer,
      isCameraReady: isCameraReady ?? this.isCameraReady,
    );
  }
}