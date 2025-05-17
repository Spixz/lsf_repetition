import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_search_hint_result.dart';

abstract class LsfDictionaryRepository {
  Future<List<LsfDictionarySearchResult>> searchDefinition(String query);
  Future<List<LsfDictionarySearchHintResult>> searchDefinitionHints({
    required String query,
    int limit = 10,
    int page = 1,
  });
}
