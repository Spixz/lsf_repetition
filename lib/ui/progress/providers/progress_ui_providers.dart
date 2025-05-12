import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';
import 'package:apprendre_lsf/global_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final totalAddedCardsProvider = AutoDisposeFutureProvider((ref) async {
  final allCards = await ref.watch(decksRepositoryProvider).getAllCards();
  return allCards.length;
});

final totalLearnedCardsProvider = AutoDisposeFutureProvider((ref) async {
  final allCards = await ref.watch(decksRepositoryProvider).getAllCards();
  final learnedCards =
      allCards
          .where((card) => card.retentionCard?.state == RetentionState.review)
          .toList();
  return learnedCards.length;
});
