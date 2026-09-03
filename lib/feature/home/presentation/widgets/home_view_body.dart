import 'package:basirah/core/utils/colors/app_colors.dart';
import 'package:basirah/core/utils/constant/enums.dart';
import 'package:basirah/feature/home/presentation/cubit/voice_assistant_cubit.dart';
import 'package:basirah/feature/home/presentation/widgets/home_status_panel.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoiceAssistantCubit, VoiceAssistantState>(
      buildWhen: (prev, curr) => prev.status != curr.status || prev.lastAnswer != curr.lastAnswer,
      builder: (context, state) {
       if (state.status == AssistantStatus.speaking && state.lastAnswer != null) {
          return Container(
            color: AppColors.darkBackground,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(24.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 100,
                  ),
                  child: Center(
                    child: Text(
                      state.lastAnswer!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Stack(
          fit: StackFit.expand,
          children: [
            BlocBuilder<VoiceAssistantCubit, VoiceAssistantState>(
              buildWhen: (prev, curr) => prev.isCameraReady != curr.isCameraReady,
              builder: (context, state) {
                final controller = context.read<VoiceAssistantCubit>().cameraController;
                if (state.isCameraReady && controller != null) {
                  return CameraPreview(controller);
                }
                return Container(color: AppColors.darkBackground);
              },
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.darkBackground.withOpacity(0.15),
                    AppColors.darkBackground.withOpacity(0.45),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 48,
              left: 0,
              right: 0,
              child: AssistantStatusPanel(status: state.status),
            ),
          ],
        );
      },
    );
  }
}