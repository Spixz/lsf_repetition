import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck_model.freezed.dart';
part 'deck_model.g.dart';

@freezed
class DeckModel with _$DeckModel {

  const factory DeckModel({
    required String name,
    required String description,
    int? id,
    DateTime? createdAt,
  }) = _DeckModel;

  factory DeckModel.fromJson(Map<String, dynamic> json) => _$DeckModelFromJson(json);
}