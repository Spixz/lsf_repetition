import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/features/dictionaries/data/repositories/lsf_dictionaries_repository_impl.dart';
import 'package:apprendre_lsf/features/dictionaries/data/providers/elix_service_provider.dart';
import 'package:apprendre_lsf/features/dictionaries/domain/models/lsf_dictionary_search_hint_result.dart';
import 'package:apprendre_lsf/features/dictionaries/domain/models/lsf_dictionary_search_result.dart';

final lsfDictionariesRepositoryProvider = Provider((ref) {
  final elixService = ref.watch(elixProvider);
  return LsfDictionariesRepositoryImpl(dictionnaryService: elixService);
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
