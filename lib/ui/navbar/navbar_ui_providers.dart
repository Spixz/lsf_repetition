import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/utils/textfield_state.dart';
import 'package:apprendre_lsf/domain/models/revision_logic.dart';
import 'package:apprendre_lsf/global_providers.dart';
import 'package:apprendre_lsf/ui/review/providers/review_providers.dart';

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
        error: TrError(i18nIndex: "ErrorMissingField"),
      );
      return;
    }
    int? nbDays = int.tryParse(state.value);
    if (nbDays == null || nbDays <= 0) {
      state = state.copyWith(
        error: TrError(i18nIndex: "NeedPositiveNumber"),
      );
      return;
    }
    _nbDays = nbDays;
    _startTraining();
  }

  void _startTraining() async {
    final cardsToRevise = await ref
        .read(decksRepositoryProvider)
        .getCardsAddedSinceXDays(_nbDays);

    if (cardsToRevise.isEmpty) {
      state = state.copyWith(
        error: TrError(
          i18nIndex: "NoCardsAddedSinceXLastsDays",
          args: [state.value.toString()],
        ),
      );
      return;
    }

    ref.read(selectedRevisionModeProvider.notifier).state = RevisionMode.blanc;
    await ref.read(revisionLogicProvider.notifier).init(cardsToRevise);
    state = state.copyWith(validated: true);
  }
}
