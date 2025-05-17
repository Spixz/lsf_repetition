import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:apprendre_lsf/common_widgets/empty.dart';
import 'package:apprendre_lsf/shared/data/cards/providers/cards_repository_provider.dart';
import 'package:apprendre_lsf/common_widgets/navbar/widgets/my_progress_button.dart';
import 'package:apprendre_lsf/common_widgets/navbar/widgets/study_mode_button.dart';
import 'package:apprendre_lsf/common_widgets/navbar/widgets/training_mode_button.dart';

class NavbarCentralButton extends ConsumerStatefulWidget {
  const NavbarCentralButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NavbarCentralButtonState();
}

class _NavbarCentralButtonState extends ConsumerState<NavbarCentralButton> {
  @override
  Widget build(BuildContext context) {
    final dueCards = ref.watch(dueCardsStreamProvider);

    return dueCards.when(
      data: (cards) {
        return SpeedDial(
          icon: Icons.school_outlined,
          label: _dueCardsNumberLabel(cards.length),
          spacing: 10,
          children: [
            myProgressButton(context),
            trainingModeButton(context, ref),
            if (cards.isNotEmpty) studyModeButton(context, ref, mounted),
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
}
