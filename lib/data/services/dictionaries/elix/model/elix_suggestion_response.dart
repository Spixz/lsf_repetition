import 'package:freezed_annotation/freezed_annotation.dart';

part 'elix_suggestion_response.freezed.dart';
part 'elix_suggestion_response.g.dart';

@freezed
class ElixSuggestionResponse with _$ElixSuggestionResponse {
  const factory ElixSuggestionResponse(
      {required List<String> data,
      required int total}) = _ElixSuggestionResponse;

  factory ElixSuggestionResponse.fromJson(Map<String, dynamic> json) =>
      _$ElixSuggestionResponseFromJson(json);

  static ElixSuggestionResponse? safeFromJson(Map<String, dynamic> json) {
    try {
      return ElixSuggestionResponse.fromJson(json);
    } catch (error) {
      return null;
    }
  }
}
