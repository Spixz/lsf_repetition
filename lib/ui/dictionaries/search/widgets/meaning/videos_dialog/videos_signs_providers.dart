import 'dart:async';

import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_media.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

final generateControllersProvider = AutoDisposeAsyncNotifierProviderFamily<
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

// final generateControllersProvider = AutoDisposeFutureProviderFamily<
//   List<ChewieController>,
//   List<LsfDictionaryMedia>
// >((ref, signs) async {

// });

final indexVideoSelectedProvider = StateProvider((ref) => 0);
