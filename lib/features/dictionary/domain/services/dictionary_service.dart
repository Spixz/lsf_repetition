import 'package:apprendre_lsf/features/dictionary/domain/models/dictionary_search_row_result.dart';
import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_search_result.dart';

abstract interface class DictionaryService {
  Future<List<DictionarySearchRawResult>> searchDefinition(String query);
  Future<List<String>> searchDefinitionHints({
    required String query,
    required int limit,
    required int page,
  });
  LsfDictionaryName get dictionaryName;
}
