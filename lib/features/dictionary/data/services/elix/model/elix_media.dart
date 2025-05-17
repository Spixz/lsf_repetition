// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'elix_media.freezed.dart';
part 'elix_media.g.dart';

@freezed
class ElixMedia with _$ElixMedia {
  const factory ElixMedia({
    required String uri,
    required String image,
    required String? author,
  }) = _ElixMedia;

  factory ElixMedia.fromJson(Map<String, dynamic> json) =>
      _$ElixMediaFromJson(json);

  factory ElixMedia.fromJsonApi(Map<String, dynamic> json) {
    return ElixMedia(
      uri: json['uri'],
      image: json['image'],
      author: json.containsKey('author') ? json['author'] : null,
    );
  }
}
