import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
class Card with _$Card {
  const factory Card({
    int? id,
    required String name,
    required String typology,
    required String meaning,
    required List<String> videosSigns,
    required LsfDictionaryName sourceDictionnary,
    int? dictionnarySignId,
    DateTime? createdAt,
  }) = _Card;

  factory Card.fromJson(Map<String, dynamic> json) =>
      _$CardFromJson(json);
}
