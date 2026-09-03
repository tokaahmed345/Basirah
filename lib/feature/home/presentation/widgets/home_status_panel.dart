import 'package:basirah/core/utils/constant/enums.dart';
import 'package:basirah/feature/home/presentation/widgets/processing_status_panel.dart';
import 'package:basirah/feature/home/presentation/widgets/speaking_status_view.dart';
import 'package:basirah/feature/home/presentation/widgets/listening_status_view.dart';
import 'package:flutter/material.dart';

class AssistantStatusPanel extends StatelessWidget {
  final AssistantStatus status;
  const AssistantStatusPanel({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      AssistantStatus.speaking => const SpeakingStatusView(),
      AssistantStatus.listening => const ListeningStatusView(),
      AssistantStatus.processing => const ProcessingStatusView(),
    };
  }
}
