import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@freezed
class CardModel with _$CardModel {
  const factory CardModel({
    required String name,
    required String typology,
    required String meaning,
    required List<String> videosSigns,
    required LsfDictionaryName sourceDictionnary,
    required List<String> tags,
    int? deckId,
    int? id,
    int? dictionnarySignId,
    DateTime? createdAt,
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
}
