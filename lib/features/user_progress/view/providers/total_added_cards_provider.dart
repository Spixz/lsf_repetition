import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/global_providers.dart';

final totalAddedCardsProvider = AutoDisposeFutureProvider((ref) async {
  final allCards = await ref.watch(cardsRepositoryProvider).getAllCards();
  return allCards.length;
});

