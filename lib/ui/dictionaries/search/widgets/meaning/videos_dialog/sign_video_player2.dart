import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

class SignVideoPlayer2 extends StatefulWidget {
  const SignVideoPlayer2({super.key, required this.chewieController});
  final ChewieController chewieController;

  @override
  State<SignVideoPlayer2> createState() => _SignVideoPlayer2State();
}

class _SignVideoPlayer2State extends State<SignVideoPlayer2> {
  @override
  Widget build(BuildContext context) {
    return _buildVideoPlayer();
  }

  Widget _buildVideoPlayer() {
    final Size screenSize = MediaQuery.of(context).size;

    final aspectRatio =
        widget.chewieController.videoPlayerController.value.aspectRatio;
    final videoWidth = screenSize.width * 100 / 60;
    final videoHeight = videoWidth / aspectRatio;

    return Container(
        // decoration: BoxDecoration(
            // border: Border.all(color: Colors.blue.shade200, width: 4)),
        child: ClipRect(
          child: OverflowBox(
              maxWidth: videoWidth,
              child: Chewie(controller: widget.chewieController)),
        ));
  }
}
