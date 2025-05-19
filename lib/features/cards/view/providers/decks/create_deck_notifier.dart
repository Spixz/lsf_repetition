import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/shared/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/global_providers.dart';

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
