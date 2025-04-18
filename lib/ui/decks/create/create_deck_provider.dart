import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/global_providers.dart';

typedef CreateDeckFormState = ({String value, bool isValid});

final deckNameFieldProvider =
    AutoDisposeNotifierProvider<DeckNameFieldNotifier, CreateDeckFormState>(
      DeckNameFieldNotifier.new,
    );

final createDeckProvider =
    NotifierProvider<CreateDeckNotifier, AsyncValue<int>>(
      CreateDeckNotifier.new,
    );

class CreateDeckNotifier extends Notifier<AsyncValue<int>> {
  @override
  build() => AsyncLoading();

  Future call(DeckModel deckModel) async {
    final deckRepository = ref.watch(decksRepositoryProvider);

    try {
      final deckId = await deckRepository.createDeck(deck: deckModel);
      state = AsyncValue.data(deckId);
    } catch (err, st) {
      state = AsyncValue.error(err, st);
    }
  }
}

class DeckNameFieldNotifier extends AutoDisposeNotifier<CreateDeckFormState> {
  @override
  CreateDeckFormState build() => (value: "", isValid: false);

  void update(String value) =>
      state = (value: value, isValid: value.trim().isNotEmpty);

  void submit() => ref
      .read(createDeckProvider.notifier)
      .call(DeckModel(name: state.value, description: ""));
}
