import 'package:dio/dio.dart';
import 'package:apprendre_lsf/shared/domain/services/video_processing.dart';
import 'package:apprendre_lsf/utils/result.dart';
import 'package:path_provider/path_provider.dart';

class VideoFileManagerService {
  VideoFileManagerService({required this.videoProcessing});
  final VideoProcessing videoProcessing;

  Future<Result<String>> downloadVideo(String url) async {
    try {
      final dio = Dio();
      final directory = await getTemporaryDirectory();
      final filePath =
          '${directory.path}/${url.replaceAll('https://elix-lsf.s3.rbx.io.cloud.ovh.net/spip_videos/', '')}';

      await dio.download(url, filePath);

      return Result.ok(filePath);
    } catch (e) {
      print('Erreur de téléchargement : $e');
      return Result.error(Exception("erreur de télechargement"));
    }
  }

  Future<Result<bool>> isValidSAR(
    String filepath, [
    String validSAR = "1:1",
  ]) async {
    final sar = await videoProcessing.getSAR(filepath);
    if (sar is Ok && (sar as Ok).value == validSAR) {
      return Result.ok(true);
    }
    return Result.ok(false);
  }

  Future<Result<String>> updateVideoAspectRatio(
    String filepath, [
    String aspectRatio = "16/9",
  ]) {
    return videoProcessing.updateVideoAspectRatio(filepath, aspectRatio);
  }
}
