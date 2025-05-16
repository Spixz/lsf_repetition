import 'package:apprendre_lsf/shared/data/cards/repositories/cards_repository_impl.dart';
import 'package:apprendre_lsf/shared/domain/repositories/cards_repository.dart';
import 'package:apprendre_lsf/shared/domain/repositories/deck_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/shared/data/decks/repositories/decks_repository_impl.dart';
import 'package:apprendre_lsf/shared/data/database/drift_database.dart';

final driftDatabaseProvider = Provider<AppDriftDatabase>(
  (ref) => AppDriftDatabase(),
);

final decksRepositoryProvider = Provider<DeckRepository>((ref) {
  final driftDatabase = ref.watch(driftDatabaseProvider);
  return DecksRepositoryImpl(driftDatabase: driftDatabase);
});

final cardsRepositoryProvider = Provider<CardsRepository>((ref) {
  final driftDatabase = ref.watch(driftDatabaseProvider);
  return CardsRepositoryImpl(driftDatabase: driftDatabase);
});
