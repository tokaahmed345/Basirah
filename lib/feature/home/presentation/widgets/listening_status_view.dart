import 'package:basirah/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ListeningStatusView extends StatelessWidget {
  const ListeningStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Listening...',
          style: TextStyle(fontSize: 18, color: AppColors.whiteColor),
        ),
        const SizedBox(height: 24),
        Container(
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            color: AppColors.rejectColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.rejectColor.withOpacity(0.3),
                blurRadius: 16,
                spreadRadius: 4,
              ),
            ],
          ),
          child: const Icon(Icons.mic, color: AppColors.whiteColor, size: 32),
        ),
      ],
    );
  }
}
