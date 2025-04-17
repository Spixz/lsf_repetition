import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/sign_video_player.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning_with_parent.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_media.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/dialog_meaning_providers.dart';
import 'package:apprendre_lsf/utils/extensions/extensions.dart';

class DialogMeaningVideos extends ConsumerWidget {
  const DialogMeaningVideos({super.key, required this.scopedMeaning});
  final LsfDictionaryMeaningWithParent scopedMeaning;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<LsfDictionaryMedia> videosSign = scopedMeaning.meaning.wordSigns;

    return SafeArea(
      child: Container(
        color: Colors.black.withAlpha(130),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(child: _Carrousel(signs: videosSign)),
                Container(height: 80, color: Colors.blue.shade100),
                // todo : L> remplacer le container par les boutons pour ajouter
                // todo : à un deck
              ],
            ),
            _CarrouselInfos(lenght: videosSign.length),
            _closeButton(context),
          ],
        ),
      ),
    );
  }

  Widget _closeButton(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.close, color: Colors.white, size: 40),
      ),
    );
  }
}

class _CarrouselInfos extends ConsumerWidget {
  const _CarrouselInfos({required this.lenght});
  final int lenght;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      top: 0,
      left: 0,
      child: SizedBox(
        height: 50,
        width: context.width,
        child: _CarouselSliderInfos(
          itemCount: lenght,
          indexSelectedItem: ref.watch(indexVideoSelectedProvider),
        ),
      ),
    );
  }
}

class _Carrousel extends ConsumerWidget {
  const _Carrousel({required this.signs});

  final List<LsfDictionaryMedia> signs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return PageView.builder(
    //   itemCount: signs.length,
    //   itemBuilder: (_, index) {
    //     return SignVideoPlayer(video: signs[index]);
    //   },
    // );
    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        viewportFraction: 1,
        height: 500,
        padEnds: false,
        onPageChanged: (index, reason) {
          ref.read(indexVideoSelectedProvider.notifier).state = index;
        },
      ),
      items: signs.map(SignVideoPlayer.fromMedia).toList(),
    );
  }
}

class _CarouselSliderInfos extends StatelessWidget {
  _CarouselSliderInfos({
    required this.itemCount,
    required this.indexSelectedItem,
  });
  final int itemCount;
  final int indexSelectedItem;
  final selectedGradient = [Colors.grey, Colors.grey.shade100];
  final unselectedGradient = [Colors.grey.shade400, Colors.grey.shade100];

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //     itemCount: widget.itemCount,
    //     itemBuilder: (_, index) {
    //       final bool isSelected = widget.indexSelectedItem == index;

    //       return AnimatedContainer(
    //         duration: Duration(milliseconds: 100),
    //         decoration: BoxDecoration(
    //             shape: BoxShape.circle,
    //             color: isSelected ? Colors.grey : Colors.grey.shade300),
    //         width: isSelected ? 20 : 10,
    //         height: isSelected ? 20 : 10,
    //       );
    //     });

    List<Widget> dots =
        Iterable.generate(itemCount, (index) {
          final bool isSelected = indexSelectedItem == index;
          return AnimatedContainer(
            duration: Duration(milliseconds: 100),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              // gradient: RadialGradient(
              //   radius: 0.9,
              //     colors: isSelected ? selectedGradient : unselectedGradient),
            ),
            width: isSelected ? 20 : 10,
            height: isSelected ? 20 : 10,
          );
        }).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: dots.toList(),
    );
  }
}
