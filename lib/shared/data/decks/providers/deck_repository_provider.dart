import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/shared/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/global_providers.dart';

final allDecksProvider = StreamProvider<List<DeckModel>>(
  (ref) => ref.watch(decksRepositoryProvider).getAllDecksStream(),
);

final getDeckByIdProvider = AutoDisposeProviderFamily<DeckModel?, int>((
  ref,
  deckId,
) {
  final allDecks = ref.watch(allDecksProvider);
  return allDecks.maybeWhen(
    data: (decks) => decks.firstWhereOrNull((deck) => deck.id == deckId),
    orElse: () => null,
  );
});

