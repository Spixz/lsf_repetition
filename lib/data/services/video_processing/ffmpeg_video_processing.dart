import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/log.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/session.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/statistics.dart';
import 'package:path_provider/path_provider.dart';

import 'package:apprendre_lsf/data/services/video_processing/video_processing.dart';
import 'package:apprendre_lsf/utils/result.dart';

/// Some dictionary videos have an incorrect SAR (Sample Aspect Ratio),
/// often different from 1:1, which causes a black bar to appear on the
/// right side of the video, specifically on macOS and iOS (Android is unaffected).
///
/// This is due to the SAR being misinterpreted by the video players on Apple
/// platforms, leading to an incorrect display aspect ratio. For example:
///   - Detected: [SAR 3:4 DAR 4:3]
///   - Expected: [SAR 1:1 DAR 16:9]
///
/// To fix this, we use the [FfmpegVideoProcessing] class, which relies on
/// `ffmpeg_kit_flutter_min_gpl` to:
/// - Retrieve the SAR via [getSAR]
/// - Adjust the metadata and set the correct aspect ratio via [updateVideoAspectRatio]
///
/// The process involves:
/// 1. Downloading the video
/// 2. Reading its SAR metadata
/// 3. Creating a new file with corrected metadata (SAR 1:1)
/// 4. Playing the fixed version
///
/// Example FFmpeg command used:
///   ffmpeg -i input.mp4 -c copy -aspect 16:9 output.mp4
///
/// ⚠️ This method is effective but slow, since it requires downloading
/// the entire video, removing the benefits of progressive streaming.
///
/// An alternative would be to detect a bad SAR and dynamically resize the
/// player, but that still requires local access to the file metadata.
///
/// For now, we avoid implementing a Firebase Function to fix videos
/// server-side. We may fix metadata manually or consider submitting a PR
/// to improve player support for SAR on Apple platforms.
class FfmpegVideoProcessing implements VideoProcessing {
  // TODO : extract the SAR from the logs
  @override
  Future<Result<String>> getSAR(String filepath) {
    FFmpegKit.executeAsync(
      '-i $filepath',
      (Session session) async {
        session.getOutput().then((val) => print);
      },
      (Log log) {
        // print(log.getMessage());
        // CALLED WHEN SESSION PRINTS LOGS
      },
      (Statistics statistics) {
        // CALLED WHEN SESSION GENERATES STATISTICS
      },
    );
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
