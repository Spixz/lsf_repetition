import 'package:apprendre_lsf/core/app_colors.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_media.dart';
import 'package:apprendre_lsf/ui/core/centered_message.dart';
import 'package:apprendre_lsf/ui/core/empty.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/dialog_meaning_providers.dart';
import 'package:chewie/chewie.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:apprendre_lsf/utils/extensions/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignVideoPlayer extends ConsumerWidget {
  const SignVideoPlayer({required this.media, super.key});
  const SignVideoPlayer.fromMedia(this.media, {super.key});

  final LsfDictionaryMedia media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chewieController = ref.watch(generateVideoControllerProvider(media));

    return chewieController.when(
      data: (controller) {
        /*final aspectRatio =
    chewieController.videoPlayerController.value.aspectRatio;
    final videoHeight = videoWidth / aspectRatio;*/
        final videoWidth = context.width * 100 / 60;

        return SizedBox(
          // decoration: BoxDecoration(
          // border: Border.all(color: Colors.blue.shade200, width: 4)),
          child: ClipRect(
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
      loading: () => Empty(),
    );
  }
}
