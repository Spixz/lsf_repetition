import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:apprendre_lsf/ui/core/ui/empty.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/carousel_slider_infos.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/meaning_videos_signs_viewmodel.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/sign_video_player2.dart';
import 'package:apprendre_lsf/utils/result.dart';

class MeaningVideosSignsScreen extends StatefulWidget {
  const MeaningVideosSignsScreen({super.key, required this.viewModel});
  final MeaningVideosSignsViewmodel viewModel;

  @override
  State<MeaningVideosSignsScreen> createState() =>
      _MeaningVideosSignsScreenState();
}

class _MeaningVideosSignsScreenState extends State<MeaningVideosSignsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
          color: Colors.black.withAlpha(130),
          child: Stack(children: [
            Column(
              children: [
                Expanded(child: _carrousel()),
                Container(
                  height: 80,
                  color: Colors.blue.shade100,
                )
                // todo : L> remplacer le container par les boutons pour ajouter
                // todo : à un deck
              ],
            ),
            _carrouselInfos(size.width),
            _closeButton(),
          ])),
    );
  }

  Widget _carrousel() {
    return ValueListenableBuilder(
        valueListenable: widget.viewModel.createVideoControllers.results,
        builder: (_, result, __) {
          if (result.isExecuting) {
            return Center(child: CircularProgressIndicator());
          } else if (result.hasError) {
            return Text(context.tr("anErrorHasOccured"));
          } else if (result.hasData) {
            if (result.data is Ok) {
              List<ChewieController> chewieControllers =
                  (result.data as Ok).value;
              if (chewieControllers.isEmpty) {
                return Empty();
              }
              // return PageView.builder(
              //     itemCount: chewieControllers.length,
              //     itemBuilder: (_, index) {
              //       return SignVideoPlayer2(
              //         chewieController:
              //             chewieControllers[index],
              //       );
              //     });
              return CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  height: 500,
                  padEnds: false,
                  onPageChanged: (index, reason) {
                    widget.viewModel.indexSelectedVideo.value = index;
                  },
                ),
                items: chewieControllers
                    .map((controller) => SignVideoPlayer2(
                          chewieController: controller,
                        ))
                    .toList(),
              );
            }
          }
          return Empty();
        });
  }

  Widget _carrouselInfos(double screenWidth) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        height: 50,
        width: screenWidth,
        child: ValueListenableBuilder(
            valueListenable: widget.viewModel.indexSelectedVideo,
            builder: (_, index, __) {
              return CarouselSliderInfos(
                itemCount: widget.viewModel.meaning.wordSigns.length,
                indexSelectedItem: index,
              );
            }),
      ),
    );
  }

  Widget _closeButton() {
    return Positioned(
        top: 10,
        right: 10,
        child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 40,
            )));
  }
}
