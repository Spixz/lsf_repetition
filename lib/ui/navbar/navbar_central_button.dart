import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:apprendre_lsf/data/repositories/decks/deck_repository_provider.dart';
import 'package:apprendre_lsf/ui/core/empty.dart';
import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/ui/navbar/navbar_ui_providers.dart';
import 'package:apprendre_lsf/utils/textfield_state.dart';

class NavbarCentralButton extends ConsumerWidget {
  const NavbarCentralButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dueCards = ref.watch(dueCardsProvider);

    return dueCards.when(
      data: (cards) {
        return SpeedDial(
          icon: Icons.school_outlined,
          label: _dueCardsNumberLabel(cards.length),
          spacing: 10,
          children: [
            _myProgressButton(context),
            _trainingModeButton(context, ref),
            if (cards.isNotEmpty) _studyModeButton(context, ref),
          ],
        );
      },
      error: (_, __) => Empty(),
      loading: () => Empty(),
    );
  }

  Widget? _dueCardsNumberLabel(int nbDue) {
    if (nbDue == 0) {
      return null;
    }
    return Container(
      constraints: BoxConstraints(maxWidth: 18),
      child: FittedBox(child: Text(nbDue.toString())),
    );
  }

  SpeedDialChild _myProgressButton(BuildContext context) {
    return SpeedDialChild(
      child: const Icon(Icons.timeline),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      label: context.tr("MyProgress"),
      visible: true,
      onTap: () async {
        Future.delayed(
          Duration(milliseconds: 200),
          () => context.pushNamed(Routes.progress.name),
        );
      },
    );
  }

  SpeedDialChild _trainingModeButton(BuildContext context, WidgetRef ref) {
    return SpeedDialChild(
      child: const Icon(Icons.sports_esports_outlined),
      backgroundColor: Colors.deepOrange,
      foregroundColor: Colors.white,
      label: context.tr("PracticeMode"),
      onTap:
          () => showDialog(
            context: context,
            builder: (context) => _PracticeModeDialog(),
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

  SpeedDialChild _studyModeButton(BuildContext context, WidgetRef ref) {
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
      // labelShadow: [
      //   BoxShadow(
      //     color: Colors.black.withAlpha(150),
      //     offset: Offset(3, 3),
      //     blurRadius: 8,
      //   ),
      // ],
      onTap: () {},
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
}

class _PracticeModeDialog extends ConsumerStatefulWidget {
  const _PracticeModeDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __PracticeModeDialogState();
}

class __PracticeModeDialogState extends ConsumerState<_PracticeModeDialog> {
  @override
  void initState() {
    ref.listenManual(cardsAddSinceProvider, _onFormStateChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(cardsAddSinceProvider);

    return AlertDialog(
      title: Text(context.tr("PracticeMode")),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(context.tr("CardsAddSince")),
          TextFormField(
            keyboardType: TextInputType.number,
            autocorrect: false,
            initialValue: formState.defaultValue,
            onChanged: ref.read(cardsAddSinceProvider.notifier).onChange,
            onFieldSubmitted: ref.read(cardsAddSinceProvider.notifier).validate,
          ),
          if (formState.error != null)
            Padding(
              padding: const EdgeInsets.only(top: 13),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  context.tr(
                    formState.error!.i18nIndex,
                    args: formState.error!.args,
                  ),
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(context.tr("Close")),
        ),
        TextButton(
          onPressed:
              () => ref.read(cardsAddSinceProvider.notifier).validate(''),
          child: Text(context.tr("Validate")),
        ),
      ],
    );
  }

  void _onFormStateChange(_, TextFieldState state) {
    if (state.validated) {
      context.pop();
      context.pushNamed(
        Routes.review.name,
        pathParameters: {"title": context.tr("Practice")},
      );
    }
  }
}
