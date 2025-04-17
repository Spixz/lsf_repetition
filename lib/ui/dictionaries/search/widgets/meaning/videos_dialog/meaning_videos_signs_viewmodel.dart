import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_media.dart';
import 'package:apprendre_lsf/utils/result.dart';
import 'package:video_player/video_player.dart';

class MeaningVideosSignsViewmodel {
  MeaningVideosSignsViewmodel({required this.meaning}) {
    createVideoControllers = Command.createAsyncNoParam(_createVideoControllers,
        initialValue: Result.ok([]));
    createVideoControllers.execute();
  }

  final LsfDictionaryMeaning meaning;
  late Command<void, Result<List<ChewieController>>> createVideoControllers;
  final ValueNotifier<int> indexSelectedVideo = ValueNotifier(0);

  //TODO : COMMAND Ajouter le sign a mes cartes
  //TODO : COMMAND Ajouter le sign a la liste de lecture

  LsfDictionaryMedia get selectedMedia =>
      meaning.wordSigns[indexSelectedVideo.value];

  Future<Result<List<ChewieController>>> _createVideoControllers() async {
    final futures = meaning.wordSigns.map(_createChewieController);
    final controllers = await Future.wait<ChewieController>(futures);
    return Result.ok(controllers);
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
