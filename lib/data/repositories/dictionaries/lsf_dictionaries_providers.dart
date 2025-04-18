import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/data/repositories/dictionaries/lsf_dictionaries_repository.dart';
import 'package:apprendre_lsf/data/services/dictionaries/dictionaries_providers.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_hint_result.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';

final lsfDictionariesRepositoryProvider = Provider((ref) {
  final elixService = ref.watch(elixProvider);
  return LsfDictionariesRepository(elixService: elixService);
});

final searchDefinitionHintsResultsProvider = FutureProvider.autoDispose
    .family<List<LsfDictionarySearchHintResult>, String>((ref, query) async {
      final lsfDictionariesRepository = ref.watch(
        lsfDictionariesRepositoryProvider,
      );
      return lsfDictionariesRepository.searchDefinitionHints(query: query);
    });

final searchDefinitionResultsProvider =
    FutureProvider.family<List<LsfDictionarySearchResult>, String>((
      ref,
      query,
    ) {
      if (query.isEmpty) return [];
      final lsfDictionariesRepository = ref.watch(
        lsfDictionariesRepositoryProvider,
      );
      return lsfDictionariesRepository.searchDefinition(query);
    });
