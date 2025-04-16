import 'package:freezed_annotation/freezed_annotation.dart';

part 'lsf_dictionary_media.freezed.dart';
part 'lsf_dictionary_media.g.dart';

@freezed
class LsfDictionaryMedia with _$LsfDictionaryMedia {

  const factory LsfDictionaryMedia({
  required String videoUrl,
  required String imageUrl,
  required String? author,
  }) = _LsfDictionaryMedia;

  factory LsfDictionaryMedia.fromJson(Map<String, dynamic> json) => _$LsfDictionaryMediaFromJson(json);
}