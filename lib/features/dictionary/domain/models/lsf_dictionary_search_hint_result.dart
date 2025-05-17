import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_search_result.dart';

part 'lsf_dictionary_search_hint_result.freezed.dart';
part 'lsf_dictionary_search_hint_result.g.dart';

@freezed
class LsfDictionarySearchHintResult with _$LsfDictionarySearchHintResult {
  factory LsfDictionarySearchHintResult({
    required String word,
    required LsfDictionaryName source,
  }) = _LsfDictionarySearchHintResult;

  factory LsfDictionarySearchHintResult.fromJson(Map<String, dynamic> json) =>
      _$LsfDictionarySearchHintResultFromJson(json);
}
