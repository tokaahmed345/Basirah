import 'dart:typed_data';
import 'package:basirah/core/utils/failure/failure.dart';
import 'package:basirah/feature/home/domain/repo/vision_ai_repo.dart';
import 'package:dartz/dartz.dart';

class VisionAiUseCase {
  final VisionAiRepository repository;

  VisionAiUseCase(this.repository);

  Future<Either<Failure, String>> call({
    required String question,
    required Uint8List imageBytes,
  }) {
    return repository.analyzeImage(question: question, imageBytes: imageBytes);
  }
}