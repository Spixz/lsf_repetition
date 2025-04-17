import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning_with_parent.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_media.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/videos_signs_providers.dart';
import 'package:apprendre_lsf/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:apprendre_lsf/ui/core/ui/empty.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/carousel_slider_infos.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/sign_video_player2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MeaningVideosSignsScreen extends ConsumerWidget {
  const MeaningVideosSignsScreen({super.key, required this.scopedMeaning});
  final LsfDictionaryMeaningWithParent scopedMeaning;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        color: Colors.black.withAlpha(130),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: CarrouselVideosSigns(
                    signs: scopedMeaning.meaning.wordSigns,
                  ),
                ),
                Container(height: 80, color: Colors.blue.shade100),
                // todo : L> remplacer le container par les boutons pour ajouter
                // todo : à un deck
              ],
            ),
            CarrouselInfos(lenght: scopedMeaning.meaning.wordSigns.length),
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

class CarrouselInfos extends ConsumerWidget {
  const CarrouselInfos({super.key, required this.lenght});
  final int lenght;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      top: 0,
      left: 0,
      child: SizedBox(
        height: 50,
        width: context.width,
        child: CarouselSliderInfos(
          itemCount: lenght,
          indexSelectedItem: ref.watch(indexVideoSelectedProvider),
        ),
      ),
    );
  }
}

class CarrouselVideosSigns extends ConsumerWidget {
  const CarrouselVideosSigns({super.key, required this.signs});

  final List<LsfDictionaryMedia> signs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(generateControllersProvider(signs));

    return result.when(
      data: (data) {
        final chewieControllers = data;
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
              ref.read(indexVideoSelectedProvider.notifier).state = index;
            },
          ),
          items:
              chewieControllers.map(SignVideoPlayer2.fromControllers).toList(),
        );
      },
      error: (err, st) => Text(context.tr("anErrorHasOccured")),
      loading: () => Empty(),
    );
  }
}
