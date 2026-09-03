import 'dart:typed_data';
import 'package:basirah/core/utils/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class VisionAiRepository {
  Future<Either<Failure, String>> analyzeImage({
    required String question,
    required Uint8List imageBytes,
  });
}