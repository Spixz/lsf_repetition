import 'package:apprendre_lsf/features/dictionaries/domain/models/dictionary_search_row_result.dart';

abstract interface class DictionaryService {
  Future<List<DictionarySearchRawResult>> searchDefinition(String query);
  Future<List<String>> searchDefinitionHints({
    required String query,
    required int limit,
    required int page,
  });
}
