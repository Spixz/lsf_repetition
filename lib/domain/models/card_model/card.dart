import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
class CardModel with _$CardModel {
  const CardModel._();
  const factory CardModel({
    int? id,
    int? deckId,
    required String name,
    required String typology,
    required String meaning,
    required List<String> videosSigns,
    required LsfDictionaryName sourceDictionnary,
    List<String>? tags,
    int? dictionnarySignId,
    DateTime? createdAt,
  }) = _CardModel;

  bool get isStored => id != null;

  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);
}
