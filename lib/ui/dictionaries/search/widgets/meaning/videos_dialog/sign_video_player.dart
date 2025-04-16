import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_media.dart';
import 'package:video_player/video_player.dart';

class SignVideoPlayer extends StatefulWidget {
  const SignVideoPlayer({super.key, required this.media});
  final LsfDictionaryMedia media;

  @override
  State<SignVideoPlayer> createState() => _SignVideoPlayerState();
}

class _SignVideoPlayerState extends State<SignVideoPlayer> {
  VideoPlayerController? videoController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    _loadVideoControllers();
  }

  void _loadVideoControllers() async {
    videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.media.videoUrl));
    await videoController!.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoController!,
      autoPlay: true,
      looping: true,
      showControls: false
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _videoOrLoarder();
  }

  Widget _videoOrLoarder() {
    return (videoController == null || !videoController!.value.isInitialized)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            alignment: Alignment.topCenter,
            // height: 300,
            child: _buildVideoPlayer(),
          );
  }

  Widget _buildVideoPlayer() {
    final Size screenSize = MediaQuery.of(context).size;

    final width = screenSize.width * 100 / 60;
    final aspectRatio = videoController!.value.aspectRatio;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue.shade200, width: 4)),
      child: OverflowBox(
        maxWidth: width, //_controller.value.size.width,
        maxHeight: width / aspectRatio,
        child: Chewie(controller: chewieController!),
      ),
    );
  }
}
