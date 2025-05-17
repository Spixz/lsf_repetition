import 'package:apprendre_lsf/features/dictionary/domain/repositories/lsf_dictionary_repository.dart';
import 'package:apprendre_lsf/features/dictionary/domain/services/dictionary_service.dart';
import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_search_hint_result.dart';

class LsfDictionaryRepositoryImpl extends LsfDictionaryRepository {
  LsfDictionaryRepositoryImpl({required DictionaryService dictionnaryService})
    : _dictionnaryService = dictionnaryService;
  final DictionaryService _dictionnaryService;

  @override
  Future<List<LsfDictionarySearchResult>> searchDefinition(String query) async {
    final searchResults = await _dictionnaryService.searchDefinition(query);

    final dictionaryResult =
        searchResults.map((result) => result.toLSFDictionaryResult()).toList();
    return dictionaryResult;
  }

  @override
  Future<List<LsfDictionarySearchHintResult>> searchDefinitionHints({
    required String query,
    int limit = 10,
    int page = 1,
  }) async {
    List<LsfDictionarySearchHintResult> results = [];

    final hintsResp = await _dictionnaryService.searchDefinitionHints(
      query: query,
      limit: limit,
      page: page,
    );

    final searchHints = hintsResp.map(
      (hint) => LsfDictionarySearchHintResult(
        word: hint,
        source: _dictionnaryService.dictionaryName,
      ),
    );
    results.insertAll(0, searchHints);

    return results;
  }
}
