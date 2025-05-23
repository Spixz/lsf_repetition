
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/global_providers.dart';
import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';

final allCardsProvider = StreamProvider<List<FullCard>>(
  (ref) => ref.watch(cardsRepositoryProvider).getAllCardsStream(),
);

final getCardsOfADeckProvider = AutoDisposeFutureProviderFamily<
  List<FullCard>,
  int
>((ref, deckId) => ref.watch(cardsRepositoryProvider).getCardsOfADeck(deckId));

final dueCardsStreamProvider = AutoDisposeStreamProvider(
  (ref) => ref.watch(cardsRepositoryProvider).getDueCardsStream(),
);
