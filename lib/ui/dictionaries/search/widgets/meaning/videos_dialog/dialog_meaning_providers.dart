import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_media.dart';

final indexVideoSelectedProvider = StateProvider((ref) => 0);

final generateVideosControllersProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      GeneProv,
      List<ChewieController>,
      List<LsfDictionaryMedia>
    >(GeneProv.new);

class GeneProv
    extends
        AutoDisposeFamilyAsyncNotifier<
          List<ChewieController>,
          List<LsfDictionaryMedia>
        > {
  @override
  FutureOr<List<ChewieController>> build(List<LsfDictionaryMedia> signs) {
    final futures = signs.map(_createChewieController);
    return Future.wait<ChewieController>(futures);
  }

  Future<ChewieController> _createChewieController(
    LsfDictionaryMedia media,
  ) async {
    final videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(media.videoUrl),
    );

    await videoPlayerController.initialize();

    final chewieContoller = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      showControls: false,
    );
    chewieContoller.play();
    return chewieContoller;
  }
}

final generateVideoControllerProvider =
    AutoDisposeFutureProviderFamily<ChewieController, LsfDictionaryMedia>((
      ref,
      media,
    ) async {
      final videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(media.videoUrl),
      );

      await videoPlayerController.initialize();

      final chewieContoller = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        showControls: false,
      );
      chewieContoller.play();
      // throw Exception("erreur mec");
      return chewieContoller;
    });
