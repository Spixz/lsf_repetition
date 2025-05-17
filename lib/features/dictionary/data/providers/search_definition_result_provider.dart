import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/features/dictionary/data/providers/lsf_dictionary_repository_provider.dart';
import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_search_result.dart';

final searchDefinitionResultsProvider =
    FutureProvider.family<List<LsfDictionarySearchResult>, String>((
      ref,
      query,
    ) {
      if (query.isEmpty) return [];
      final lsfDictionaryRepository = ref.watch(
        lsfDictionaryRepositoryProvider,
      );
      return lsfDictionaryRepository.searchDefinition(query);
    });
