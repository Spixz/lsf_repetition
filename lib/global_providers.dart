import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/data/repositories/decks/decks_repository.dart';
import 'package:apprendre_lsf/domain/database/drift_database.dart';

final driftDatabaseProvider = Provider<AppDriftDatabase>(
  (ref) => AppDriftDatabase(),
);

final decksRepositoryProvider = Provider<DecksRepository>((ref) {
  final driftDatabase = ref.watch(driftDatabaseProvider);
  return DecksRepository(driftDatabase: driftDatabase);
});
