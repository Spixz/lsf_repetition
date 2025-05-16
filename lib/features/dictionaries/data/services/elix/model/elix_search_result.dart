import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:apprendre_lsf/features/dictionaries/data/services/elix/model/elix_meaning.dart';
import 'package:apprendre_lsf/features/dictionaries/data/services/mappers/elix_to_lsf_mapper.dart';
import 'package:apprendre_lsf/features/dictionaries/domain/models/dictionary_search_row_result.dart';
import 'package:apprendre_lsf/features/dictionaries/domain/models/lsf_dictionary_search_result.dart';

part 'elix_search_result.freezed.dart';
part 'elix_search_result.g.dart';

@freezed
class ElixSearchResult
    with _$ElixSearchResult
    implements DictionarySearchRawResult {
  const ElixSearchResult._();
  const factory ElixSearchResult({
    required String name,
    required String typology,
    required List<ElixMeaning> meanings,
  }) = _ElixSearchResult;

  factory ElixSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ElixSearchResultFromJson(json);

  factory ElixSearchResult.fromJsonApi(Map<String, dynamic> json) =>
      ElixSearchResult(
        name: json['name'],
        typology: json['typology'],
        meanings:
            (json['meanings'] as List<dynamic>)
                .whereType<Map<String, dynamic>>()
                .map<ElixMeaning>(ElixMeaning.fromJsonApi)
                .toList(),
      );

  @override
  LsfDictionarySearchResult toLSFDictionaryResult() =>
      LsfDictionarySearchResult.lsfDictionarySearchResult(
        dictionaryName: LsfDictionaryName.elix,
        name: name,
        typology: typology,
        language: 'fr',
        meanings:
            meanings
                .map((meaning) => meaning.toLsfDictionaryMeaning())
                .toList(),
      );
}
