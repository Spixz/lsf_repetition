// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/features/review_cards/data/providers/revision_usecase_notifier.dart';
import 'package:apprendre_lsf/shared/data/revision/providers/selected_revision_mode_provider.dart';
import 'package:apprendre_lsf/shared/domain/usescases/revision_logic.dart';

SpeedDialChild studyModeButton(
  BuildContext context,
  WidgetRef ref,
  bool isMounted,
) {
  return SpeedDialChild(
    child: Icon(Icons.star_border, color: Colors.white)
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .scale(
          begin: Offset(1.2, 1.2),
          end: Offset(1.5, 1.5),
          duration: Duration(milliseconds: 400),
        ),
    backgroundColor: Colors.yellow.shade800,
    foregroundColor: Colors.white,
    label: context.tr("StudyMode"),
    labelStyle: TextStyle(color: Colors.white),
    labelBackgroundColor: Colors.yellow.shade800,
    onTap: () async {
      ref.read(selectedRevisionModeProvider.notifier).state = RevisionMode.fsrs;
      await ref.read(revisionUsecaseProvider.notifier).init(null);
      if (isMounted) {
        context.pushNamed(
          Routes.review.name,
          pathParameters: {"title": context.tr("Review")},
        );
      }
    },
    onLongPress:
        () => showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text(context.tr("SpacedRepetition")),
                content: Text(context.tr("StudyModeDialog")),
                actions: [
                  TextButton(
                    onPressed:
                        () => launchUrl(
                          Uri.parse(
                            "https://github.com/open-spaced-repetition/fsrs4anki/wiki/Spaced-Repetition-Algorithm:-A-Three%E2%80%90Day-Journey-from-Novice-to-Expert",
                          ),
                        ),
                    child: Text(context.tr("LearnMore")),
                  ),
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(context.tr("Close")),
                  ),
                ],
              ),
        ),
  );
}
