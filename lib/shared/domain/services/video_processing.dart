import 'package:apprendre_lsf/utils/result.dart';

abstract class VideoProcessing {
  //Future<Result<String>> downloadVideoToLocal(String url);
  Future<Result<String>> getSAR(String filepath);
  Future<Result<String>> updateVideoAspectRatio(
    String filepath, [
    String aspectRatio = "16/9",
  ]);
}
