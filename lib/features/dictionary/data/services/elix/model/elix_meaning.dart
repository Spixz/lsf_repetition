// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:apprendre_lsf/features/dictionary/data/services/elix/model/elix_media.dart';

part 'elix_meaning.freezed.dart';
part 'elix_meaning.g.dart';

@freezed
class ElixMeaning with _$ElixMeaning {
  const factory ElixMeaning({
    required int? id,
    required int wordId,
    required String definition,
    required List<ElixMedia> wordSigns,
    required List<ElixMedia> definitionSigns,
    required String sourceUrl,
  }) = _ElixMeaning;

  factory ElixMeaning.fromJson(Map<String, dynamic> json) =>
      _$ElixMeaningFromJson(json);

  factory ElixMeaning.fromJsonApi(Map<String, dynamic> json) {
    return ElixMeaning(
      id: json['id'],
      wordId: json['word_id'],
      definition: json['definition'],
      wordSigns:
          (json['wordSigns'] as List<dynamic>)
              .whereType<Map<String, dynamic>>()
              .map<ElixMedia>(ElixMedia.fromJsonApi)
              .toList(),
      definitionSigns:
          (json['definitionSigns'] as List<dynamic>)
              .whereType<Map<String, dynamic>>()
              .map<ElixMedia>(ElixMedia.fromJsonApi)
              .toList(),
      sourceUrl: json['source'],
    );
  }
}
