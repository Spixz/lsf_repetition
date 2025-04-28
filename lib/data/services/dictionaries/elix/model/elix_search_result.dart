import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apprendre_lsf/data/services/dictionaries/elix/model/elix_meaning.dart';

part 'elix_search_result.freezed.dart';
part 'elix_search_result.g.dart';

@freezed
class ElixSearchResult with _$ElixSearchResult {
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
}
