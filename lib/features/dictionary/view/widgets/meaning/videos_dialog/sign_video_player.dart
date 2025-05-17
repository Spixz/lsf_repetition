import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/core/app_colors.dart';
import 'package:apprendre_lsf/shared/data/services/video_processing/ffmpeg_video_processing.dart';
import 'package:apprendre_lsf/common_widgets/centered_message.dart';
import 'package:apprendre_lsf/common_widgets/loading_circle.dart';
import 'package:apprendre_lsf/features/dictionary/view/widgets/meaning/videos_dialog/dialog_meaning_providers.dart';
import 'package:apprendre_lsf/utils/extensions/extensions.dart';

/// Displays a zoomed-in video player centered on the person signing.
///
/// Some videos show a black bar on the right due to aspect ratio issues.
/// See [FfmpegVideoProcessing] for more details.
class SignVideoPlayer extends ConsumerWidget {
  const SignVideoPlayer({required this.videoUrl, super.key});
  const SignVideoPlayer.fromMedia(this.videoUrl, {super.key});

  final String videoUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chewieController = ref.watch(
      generateVideoControllerProvider(videoUrl),
    );

    return chewieController.when(
      data: (controller) {
        final aspectRatio = controller.videoPlayerController.value.aspectRatio;
        // la vidéo occupe fait 160% de la width => la partie visible
        // représente 60% de la vidéo.
        final videoWidth = context.width + context.width * 0.6;
        final cardHeight = videoWidth / aspectRatio;

        // return Container(
        //   height: cardHeight,
        //   margin: EdgeInsets.symmetric(horizontal: 10),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(10),
        //     child: InteractiveViewer(
        //       constrained: false,
        //       child: OverflowBox(
        //         maxWidth: videoWidth,
        //         child: Chewie(controller: controller),
        //       ),
        //     ),
        //   ),
        // );
        return Container(
          height: cardHeight,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: OverflowBox(
              maxWidth: videoWidth,
              child: Chewie(controller: controller),
            ),
          ),
        );
      },
      error: (err, st) {
        return CenteredMessage(
          message: context.tr("ErrorVideoLoading"),
          color: AppColors.error,
          fontSize: 20,
        );
      },
      loading: () => LoadingCircle(),
    );
  }
}
