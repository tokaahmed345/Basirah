import 'dart:typed_data';
import 'package:google_generative_ai/google_generative_ai.dart';

class VisionAiRemoteDataSource {
  final GenerativeModel model;

  VisionAiRemoteDataSource({required this.model});

  Future<String> analyzeImageBytes({
    required String question,
    required Uint8List imageBytes,
  }) async {
    final content = [
      Content.multi([
        TextPart(question),
        DataPart('image/jpeg', imageBytes),
      ]),
    ];

    final response = await model.generateContent(content);
    return response.text ?? 'Sorry, I could not understand that.';
  }
}