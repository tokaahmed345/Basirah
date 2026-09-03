
import 'package:basirah/core/utils/colors/app_colors.dart';
import 'package:basirah/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? icon;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            elevation: 4,
            shadowColor: AppColors.blackColor.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppStyle.text16.copyWith(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (icon != null) ...[
                const SizedBox(width: 8),
                Icon(icon, color: AppColors.whiteColor, size: 20),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
