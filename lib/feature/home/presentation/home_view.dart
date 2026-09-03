import 'package:basirah/core/utils/service_locator/service_locator.dart';
import 'package:basirah/feature/home/presentation/cubit/voice_assistant_cubit.dart';
import 'package:basirah/feature/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>getIt.get<VoiceAssistantCubit>() ,

      child: Scaffold(body: const HomeViewBody()),
    );
  }
}
