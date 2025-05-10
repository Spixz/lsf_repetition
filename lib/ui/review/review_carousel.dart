import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/sign_video_player.dart';
import 'package:apprendre_lsf/ui/review/providers/review_ui_providers.dart';
import 'package:apprendre_lsf/utils/extensions/extensions.dart';

class ReviewCarousel extends ConsumerWidget {
  const ReviewCarousel({required this.videoUrls, super.key});

  final List<String> videoUrls;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        viewportFraction: 1,
        height: double.infinity,
        padEnds: false,
        onPageChanged: (index, reason) {
          ref.read(indexVideoSelectedRevisionScreenProvider.notifier).state =
              index;
        },
      ),
      items: videoUrls.map(SignVideoPlayer.fromMedia).toList(),
    );
  }
}

/// Shows carousel position using a row of dots.
class ReviewCarouselPositionIndicator extends ConsumerWidget {
  const ReviewCarouselPositionIndicator({required this.lenght, super.key});
  final int lenght;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      width: context.width,
      child: _CarouselDot(
        itemCount: lenght,
        indexSelectedItem: ref.watch(indexVideoSelectedRevisionScreenProvider),
      ),
    );
  }
}

class _CarouselDot extends StatelessWidget {
  const _CarouselDot({
    required this.itemCount,
    required this.indexSelectedItem,
  });
  final int itemCount;
  final int indexSelectedItem;

  @override
  Widget build(BuildContext context) {
    List<Widget> dots =
        Iterable.generate(itemCount, (index) {
          final bool isSelected = indexSelectedItem == index;
          return AnimatedContainer(
            duration: Duration(milliseconds: 100),
            decoration: BoxDecoration(
              color:
                  (isSelected)
                      ? context.primaryColor
                      : context.primaryColor.withAlpha(100),
              shape: BoxShape.circle,
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
