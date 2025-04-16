import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/log.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/session.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/statistics.dart';
import 'package:apprendre_lsf/utils/result.dart';
import 'package:path_provider/path_provider.dart';
import 'package:apprendre_lsf/data/services/video_processing/video_processing.dart';

class FfmpegVideoProcessing implements VideoProcessing {
  // ! L'infos se trouve ici il faut la grep et utiliser
  // ! await le temps que execute se termine
  @override
  Future<Result<String>> getSAR(String filepath) {
    FFmpegKit.executeAsync('-i $filepath', (Session session) async {
      session.getOutput().then((val) => print);
    }, (Log log) {
      // print(log.getMessage());
      // CALLED WHEN SESSION PRINTS LOGS
    }, (Statistics statistics) {
      // CALLED WHEN SESSION GENERATES STATISTICS
    });
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> updateVideoAspectRatio(
    String filepath, [
    String aspectRatio = "16:9",
  ]) async {
    if (filepath.isEmpty) {
      return Result.error(Exception('Empty filepath'));
    }
    final filename = 'XXXXXX';
    final directory = await getTemporaryDirectory();
    final outputPath = '${directory.path}/fixed-$filename';

    await FFmpegKit.execute("-i $filepath -c copy -aspect 16:9 $outputPath");
    return Result.ok(outputPath);
  }
}
