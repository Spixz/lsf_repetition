import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/global_providers.dart';
import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';

final totalLearnedCardsProvider = AutoDisposeFutureProvider((ref) async {
  final allCards = await ref.watch(cardsRepositoryProvider).getAllCards();
  final learnedCards =
      allCards
          .where((card) => card.retentionCard?.state == RetentionState.review)
          .toList();
  return learnedCards.length;
});
