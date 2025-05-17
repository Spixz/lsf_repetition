import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_media.dart';

part 'lsf_dictionary_meaning.freezed.dart';
part 'lsf_dictionary_meaning.g.dart';

@freezed
class LsfDictionaryMeaning with _$LsfDictionaryMeaning {
  const factory LsfDictionaryMeaning({
    required String definition,
    required List<LsfDictionaryMedia> wordSigns,
    required List<LsfDictionaryMedia> definitionSigns,
  }) = _LsfDictionaryMeaning;

  factory LsfDictionaryMeaning.fromJson(Map<String, dynamic> json) =>
      _$LsfDictionaryMeaningFromJson(json);
}
