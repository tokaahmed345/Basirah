import 'package:basirah/feature/home/data/datasource/vision_ai_remote_datasource.dart';
import 'package:basirah/feature/home/data/repo_impl/vision_ai_repo_impl.dart';
import 'package:basirah/feature/home/domain/repo/vision_ai_repo.dart';
import 'package:basirah/feature/home/domain/usecase/vision_ai_usecase.dart';
import 'package:basirah/feature/home/presentation/cubit/voice_assistant_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {


getIt.registerLazySingleton<GenerativeModel>(
  () => GenerativeModel(model: 'gemini-2.5-flash', apiKey: dotenv.env['GEMINI_API_KEY']!),
);
getIt.registerLazySingleton<VisionAiRemoteDataSource>(
  () => VisionAiRemoteDataSource(model: getIt()),
);
getIt.registerLazySingleton<VisionAiRepository>(
  () => VisionAiRepositoryImpl(remoteDataSource: getIt()),
);
getIt.registerLazySingleton(() => VisionAiUseCase(getIt()));
getIt.registerFactory(() => VoiceAssistantCubit( getIt()));



}
