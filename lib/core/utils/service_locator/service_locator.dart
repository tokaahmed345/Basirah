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







  //   getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  //   getIt.registerLazySingleton<FirebaseFirestore>(
  //     () => FirebaseFirestore.instance,
  //   );
  //   getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  //   getIt.registerLazySingleton<FirebaseMessaging>(() => FirebaseMessaging.instance);

  //   getIt.registerLazySingleton<SharedPrefs>(() => SharedPrefs());

  //   getIt.registerLazySingleton<SignUpRemoteDataSource>(
  //     () => SignUpRemoteDataSource(
  //       firebaseAuth: getIt<FirebaseAuth>(),
  //       firestore: getIt<FirebaseFirestore>(),
  //     ),
  //   );

  //   getIt.registerLazySingleton<SignUpRepoImpl>(
  //     () => SignUpRepoImpl(
  //       remoteDataSource: getIt<SignUpRemoteDataSource>(),
  //       // sharedPrefs: getIt<SharedPrefs>(),
  //     ),
  //   );
  //   getIt.registerFactory<SignUpCubit>(() => SignUpCubit());
  //   getIt.registerLazySingleton<LogInRemoteDataSource>(
  //     () => LogInRemoteDataSource(
  //       firebaseAuth: getIt<FirebaseAuth>(),
  //       firestore: getIt<FirebaseFirestore>(),
  //     ),
  //   );

  //   getIt.registerLazySingleton<ForgotRemoteDataSource>(
  //     () => ForgotRemoteDataSource(firebaseAuth: getIt<FirebaseAuth>()),
  //   );
  //   getIt.registerLazySingleton<LogInRepoImpl>(
  //     () => LogInRepoImpl(
  //       remoteDataSource: getIt<LogInRemoteDataSource>(),
  //       // sharedPrefs: getIt<SharedPrefs>(),
  //     ),
  //   );
  //   getIt.registerLazySingleton<ForgotPasswordRepoImpl>(
  //     () => ForgotPasswordRepoImpl(
  //       remoteDataSource: getIt<ForgotRemoteDataSource>(),
  //     ),
  //   );
  //   getIt.registerFactory<LogInCubit>(() => LogInCubit());
  //   getIt.registerFactory<ForgotPasswordCubit>(() => ForgotPasswordCubit());

  //   getIt.registerLazySingleton<Dio>(() => Dio());
  //   getIt.registerLazySingleton<ApiService>(() => DioConsumer(dio: getIt<Dio>()));
  //   getIt.registerLazySingleton<AiVisionRemoteDataSource>(
  //     () => AiVisionRemoteDataSource(apiService: getIt.get<ApiService>()),
  //   );

  //   getIt.registerLazySingleton<AiVisionRepository>(
  //     () => AiVisionRepositoryImpl(
  //       remoteDataSource: getIt<AiVisionRemoteDataSource>(),
  //     ),
  //   );

  //   getIt.registerLazySingleton<AnalyzeImageUseCase>(
  //     () => AnalyzeImageUseCase(getIt<AiVisionRepository>()),
  //   );

  //   // ================= Report Item Feature =================
  //   getIt.registerLazySingleton<ReportItemRemoteDataSource>(
  //     () => ReportItemRemoteDataSource(
  //       firestore: getIt<FirebaseFirestore>(),
  //       auth: getIt<FirebaseAuth>(),
  //       supabase: getIt.get<SupabaseClient>(),
  //     ),
  //   );

  //   getIt.registerLazySingleton<ReportItemRepository>(
  //     () => ReportItemRepositoryImpl(
  //       remoteDataSource: getIt<ReportItemRemoteDataSource>(),
  //     ),
  //   );

  //   getIt.registerLazySingleton<ReportItemUseCase>(
  //     () => ReportItemUseCase(getIt<ReportItemRepository>()),
  //   );
  //   getIt.registerFactory<AiVisionCubit>(
  //     () => AiVisionCubit(analyzeImageUseCase: getIt<AnalyzeImageUseCase>()),
  //   );
  //   // ================= Cubits =================
  //   getIt.registerFactory<ReportItemCubit>(
  //     () => ReportItemCubit(createFoundReportUseCase: getIt<ReportItemUseCase>()),
  //   );

  //   getIt.registerLazySingleton<MyPostsRemoteDataSource>(
  //     () => MyPostsRemoteDataSource(
  //       firestore: getIt<FirebaseFirestore>(),
  //       auth: getIt<FirebaseAuth>(),
  //     ),
  //   );

  //   getIt.registerLazySingleton<MyPostsRepository>(
  //     () => MyPostsRepositoryImpl(
  //       remoteDataSource: getIt<MyPostsRemoteDataSource>(),
  //     ),
  //   );

  //   getIt.registerLazySingleton<GetMyPostsUseCase>(
  //     () => GetMyPostsUseCase(getIt<MyPostsRepository>()),
  //   );

  //   getIt.registerLazySingleton<MyPostsCubit>(
  //     () => MyPostsCubit(useCase: getIt<GetMyPostsUseCase>()),
  //   );

  // getIt.registerLazySingleton<NotificationRepo>(
  //   () => NotificationRepoImpl(getIt()),
  // );
  // getIt.registerLazySingleton<NotificationsUseCase>(
  //   () => NotificationsUseCase(getIt()),
  // );

  // getIt.registerFactory<NotificationCubit>(
  //   () => NotificationCubit(
  //     notificationsUseCase: getIt(),

  //   ),
  // );

  //     getIt.registerLazySingleton<NotificationRemoteDataSource>(
  //     () => NotificationRemoteDataSource( ),
  //   );
  //   getIt.registerLazySingleton<ClaimRemoteDataSource>(
  //     () => ClaimRemoteDataSource(firestore: getIt<FirebaseFirestore>(), notificationDataSource: getIt.get<NotificationRemoteDataSource>()),
  //   );

  //   getIt.registerLazySingleton<ClaimRepo>(
  //     () => ClaimRepoImpl(remoteDataSource: getIt<ClaimRemoteDataSource>()),
  //   );

  //   getIt.registerLazySingleton<ClaimUseCase>(
  //     () => ClaimUseCase(getIt<ClaimRepo>()),
  //   );

  //   getIt.registerFactory<ReviewClaimCubit>(
  //     () => ReviewClaimCubit(claimUseCase: getIt<ClaimUseCase>()),
  //   );

  //   getIt.registerLazySingleton<PostsRemoteDataSource>(
  //     () => PostsRemoteDataSource(getIt<FirebaseFirestore>()),
  //   );

  //   getIt.registerLazySingleton<PostsRepository>(
  //     () => PostsRepositoryImpl(getIt<PostsRemoteDataSource>()),
  //   );

  //   getIt.registerLazySingleton<GetAllPostsUseCase>(
  //     () => GetAllPostsUseCase(getIt<PostsRepository>()),
  //   );
  //   getIt.registerLazySingleton<PostsCubit>(
  //     () => PostsCubit(getIt<GetAllPostsUseCase>()),
  //   );
  //   getIt.registerLazySingleton<VerifyClaimRemoteDataSource>(
  //     () => VerifyClaimRemoteDataSource(
  //       firestore: getIt<FirebaseFirestore>(),
  //       auth: getIt<FirebaseAuth>(), notificationDataSource:getIt.get<NotificationRemoteDataSource>() ,
  //     ),
  //   );

  //   getIt.registerLazySingleton<VerifyClaimRepository>(
  //     () => VerifyClaimRepositoryImpl(getIt<VerifyClaimRemoteDataSource>()),
  //   );

  //   getIt.registerLazySingleton<VerfyClaimUseCase>(
  //     () => VerfyClaimUseCase(getIt<VerifyClaimRepository>()),
  //   );

  //   getIt.registerFactory<VerifyClaimCubit>(
  //     () => VerifyClaimCubit(getIt<VerfyClaimUseCase>()),
  //   );

  // }
}
