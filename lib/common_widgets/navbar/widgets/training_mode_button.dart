import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

import 'package:apprendre_lsf/common_widgets/navbar/widgets/pratice_mode_dialog.dart';

SpeedDialChild trainingModeButton(BuildContext context, WidgetRef ref) {
  return SpeedDialChild(
    child: const Icon(Icons.sports_esports_outlined),
    backgroundColor: Colors.deepOrange,
    foregroundColor: Colors.white,
    label: context.tr("PracticeMode"),
    onTap:
        () => showDialog(
          context: context,
          builder: (context) => PracticeModeDialog(),
        ),
    onLongPress:
        () => showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text(context.tr("PracticeMode")),
                content: Text(context.tr("PracticeModeDialog")),
                actions: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(context.tr("Close")),
                  ),
                ],
              ),
        ),
  );
}
