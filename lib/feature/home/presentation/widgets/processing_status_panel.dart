import 'package:basirah/core/utils/colors/app_colors.dart';
import 'package:basirah/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class ProcessingStatusView extends StatelessWidget {
  const ProcessingStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        "processing...",
        style:AppStyle.text20.copyWith(color: AppColors.approveLightBg),
        
       
      ),
    );
  }
}