import 'package:apprendre_lsf/features/dictionaries/domain/repositories/lsf_dictionaries_repository.dart';
import 'package:apprendre_lsf/features/dictionaries/domain/services/dictionary_service.dart';
import 'package:apprendre_lsf/features/dictionaries/domain/models/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/features/dictionaries/domain/models/lsf_dictionary_search_hint_result.dart';

class LsfDictionariesRepositoryImpl extends LsfDictionariesRepository {
  LsfDictionariesRepositoryImpl({required DictionaryService dictionnaryService})
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
    List<LsfDictionaryName> sources = const [LsfDictionaryName.elix],
  }) async {
    List<LsfDictionarySearchHintResult> results = [];

    if (sources.contains(LsfDictionaryName.elix)) {
      final elixResp = await _dictionnaryService.searchDefinitionHints(
        query: query,
        limit: limit,
        page: page,
      );

      final searchHints = elixResp.map(
        (hint) => LsfDictionarySearchHintResult(
          word: hint,
          source: LsfDictionaryName.elix,
        ),
      );
      results.insertAll(0, searchHints);
    }

    return results;
  }
}
