import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/features/dictionary/data/providers/lsf_dictionary_repository_provider.dart';
import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_search_hint_result.dart';

final searchDefinitionHintsResultsProvider = FutureProvider.autoDispose
    .family<List<LsfDictionarySearchHintResult>, String>((ref, query) async {
      final lsfDictionaryRepository = ref.watch(
        lsfDictionaryRepositoryProvider,
      );
      return lsfDictionaryRepository.searchDefinitionHints(query: query);
    });
