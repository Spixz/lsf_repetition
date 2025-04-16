import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning.dart';

part 'lsf_dictionary_search_result.freezed.dart';
part 'lsf_dictionary_search_result.g.dart';

enum LsfDictionaryName { elix, spreadthesign }

@freezed
class LsfDictionarySearchResult with _$LsfDictionarySearchResult {
  const factory LsfDictionarySearchResult.lsfDictionarySearchResult({
    required String name,
    required String typology,
    required List<LsfDictionaryMeaning> meanings,
    required LsfDictionaryName dictionaryName,
    required String language,
  }) = _LsfDictionarySearchResult;

  factory LsfDictionarySearchResult.fromJson(Map<String, dynamic> json) =>
      _$LsfDictionarySearchResultFromJson(json);
}
