import 'package:basirah/core/utils/router/app_router.dart';
import 'package:basirah/core/utils/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main()async {
  await dotenv.load(fileName: ".env");
  setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
 
    );
  }
}