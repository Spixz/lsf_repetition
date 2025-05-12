import 'package:apprendre_lsf/data/services/dictionaries/elix/elix_service.dart';
import 'package:apprendre_lsf/domain/mappers/elix_to_lsf_mapper.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_hint_result.dart';

class LsfDictionariesRepository {
  LsfDictionariesRepository({required ElixService elixService})
    : _elixService = elixService;
  final ElixService _elixService;

  Future<List<LsfDictionarySearchResult>> searchDefinition(String query) async {
    final elixSearchResults = await _elixService.searchDefinition(query);

    List<LsfDictionarySearchResult> elixDictionaryResult =
        elixSearchResults
            .map((result) => result.toLSFDictionaryResult())
            .toList();

    return elixDictionaryResult;
  }

  Future<List<LsfDictionarySearchHintResult>> searchDefinitionHints({
    required String query,
    int limit = 10,
    int page = 1,
    List<LsfDictionaryName> sources = const [LsfDictionaryName.elix],
  }) async {
    List<LsfDictionarySearchHintResult> results = [];

    if (sources.contains(LsfDictionaryName.elix)) {
      final elixResp = await _elixService.searchDefinitionHints(
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
