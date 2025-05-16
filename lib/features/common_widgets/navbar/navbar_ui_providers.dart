import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/utils/textfield_state.dart';
import 'package:apprendre_lsf/shared/domain/usescases/revision_logic.dart';
import 'package:apprendre_lsf/global_providers.dart';
import 'package:apprendre_lsf/features/review_cards/data/providers/review_providers.dart';
import 'package:apprendre_lsf/utils/tr_entry.dart';
import 'package:apprendre_lsf/shared/data/revision/providers/selected_revision_mode_provider.dart';

final cardsAddSinceProvider = AutoDisposeNotifierProvider(
  CardsAddSinceNotifier.new,
);

class CardsAddSinceNotifier extends AutoDisposeNotifier<TextFieldState> {
  int _nbDays = 1;

  @override
  TextFieldState build() {
    return TextFieldState(
      value: _nbDays.toString(),
      defaultValue: _nbDays.toString(),
    );
  }

  void onChange(String value) {
    state = TextFieldState(value: value);
  }

  void validate(String _) {
    if (state.value.isEmpty) {
      state = state.copyWith(
        error: TrEntry(i18nIndex: "ErrorMissingField"),
      );
      return;
    }
    int? nbDays = int.tryParse(state.value);
    if (nbDays == null || nbDays <= 0) {
      state = state.copyWith(
        error: TrEntry(i18nIndex: "NeedPositiveNumber"),
      );
      return;
    }
    _nbDays = nbDays;
    _startTraining();
  }

  void _startTraining() async {
    final cardsToRevise = await ref
        .read(cardsRepositoryProvider)
        .getCardsAddedSinceXDays(_nbDays);

    if (cardsToRevise.isEmpty) {
      state = state.copyWith(
        error: TrEntry(
          i18nIndex: "NoCardsAddedSinceXLastsDays",
          args: [state.value.toString()],
        ),
      );
      return;
    }

    ref.read(selectedRevisionModeProvider.notifier).state = RevisionMode.training;
    await ref.read(revisionUsecaseProvider.notifier).init(cardsToRevise);
    state = state.copyWith(validated: true);
  }
}
