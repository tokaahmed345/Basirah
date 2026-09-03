import 'dart:typed_data';
import 'package:basirah/core/utils/failure/failure.dart';
import 'package:basirah/feature/home/data/datasource/vision_ai_remote_datasource.dart';
import 'package:basirah/feature/home/domain/repo/vision_ai_repo.dart';
import 'package:dartz/dartz.dart';

class VisionAiRepositoryImpl implements VisionAiRepository {
  final VisionAiRemoteDataSource remoteDataSource;

  VisionAiRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> analyzeImage({
    required String question,
    required Uint8List imageBytes,
  }) async {
    try {
      final result = await remoteDataSource.analyzeImageBytes(
        question: question,
        imageBytes: imageBytes,
      );
      return Right(result);
    } catch (e) {
      return Left(AiAnalysisFailure(e.toString()));
    }
  }
}