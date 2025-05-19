import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/shared/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/features/cards/view/providers/decks/create_deck_notifier.dart';

typedef CreateDeckFormState = ({String value, bool isValid});

final deckNameFieldProvider =
    AutoDisposeNotifierProvider<DeckNameFieldNotifier, CreateDeckFormState>(
      DeckNameFieldNotifier.new,
    );

class DeckNameFieldNotifier extends AutoDisposeNotifier<CreateDeckFormState> {
  @override
  CreateDeckFormState build() => (value: "", isValid: false);

  void update(String value) =>
      state = (value: value, isValid: value.trim().isNotEmpty);

  void submit() => ref
      .read(createDeckProvider.notifier)
      .call(DeckModel(name: state.value, description: ""));
}
