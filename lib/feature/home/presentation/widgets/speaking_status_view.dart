import 'package:basirah/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SpeakingStatusView extends StatelessWidget {
  const SpeakingStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Center(child: Text(     "Hello, point the camera at what is around you and ask me anything anytime")),
        Container(
          width: 76,
          height: 76,
          decoration: const BoxDecoration(
            color: AppColors.accentGold,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.mic_off_rounded,
            color: AppColors.charcoal,
            size: 32,
          ),
        ),
      ],
    );
  }
}
