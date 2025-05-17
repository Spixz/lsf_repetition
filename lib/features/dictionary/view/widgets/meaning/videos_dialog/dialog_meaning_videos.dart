import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';

import 'package:apprendre_lsf/features/dictionary/view/widgets/meaning/videos_dialog/sign_video_player.dart';
import 'package:apprendre_lsf/features/dictionary/view/widgets/meaning/videos_dialog/dialog_meaning_providers.dart';
import 'package:apprendre_lsf/utils/extensions/extensions.dart';
import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';
import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/shared/domain/models/card/card.dart';

/// An overlay screen showing a video for each different way to sign a word.
class DialogMeaningVideos extends ConsumerWidget {
  const DialogMeaningVideos({super.key, required this.fullcard});
  final FullCard fullcard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> videosSigns = fullcard.card.videosSigns;

    return SafeArea(
      child: Container(
        color: Colors.black.withAlpha(150),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(child: _Carousel(videoUrls: videosSigns)),
                _ActionsBar(card: fullcard.card),
              ],
            ),
            _CarouselPositionIndicator(lenght: videosSigns.length),
            _closeButton(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _closeButton(BuildContext context, WidgetRef ref) {
    return Positioned(
      top: 10,
      right: 10,
      child: IconButton(
        onPressed: () {
          ref.read(indexVideoSelectedDialogMeaningProvider.notifier).state = 0;
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.close, color: Colors.white, size: 40),
      ),
    );
  }
}

class _Carousel extends ConsumerWidget {
  const _Carousel({required this.videoUrls, super.key});

  final List<String> videoUrls;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView.builder(
      itemCount: videoUrls.length,
      onPageChanged: (index) {
        ref.read(indexVideoSelectedDialogMeaningProvider.notifier).state =
            index;
      },
      itemBuilder: (_, index) {
        return Align(child: SignVideoPlayer(videoUrl: videoUrls[index]));
      },
    );
  }
}

/// Shows carousel position using a row of dots.
class _CarouselPositionIndicator extends ConsumerWidget {
  const _CarouselPositionIndicator({required this.lenght, super.key});
  final int lenght;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      top: 0,
      left: 0,
      child: SizedBox(
        height: 50,
        width: context.width,
        child: _CarouselDot(
          itemCount: lenght,
          indexSelectedItem: ref.watch(indexVideoSelectedDialogMeaningProvider),
        ),
      ),
    );
  }
}

class _CarouselDot extends StatelessWidget {
  _CarouselDot({required this.itemCount, required this.indexSelectedItem});
  final int itemCount;
  final int indexSelectedItem;
  final selectedGradient = [Colors.grey, Colors.grey.shade100];
  final unselectedGradient = [Colors.grey.shade400, Colors.grey.shade100];

  @override
  Widget build(BuildContext context) {
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

class _ActionsBar extends ConsumerWidget {
  const _ActionsBar({super.key, required this.card});
  final CardModel card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildButton(
              context.tr("SaveTheSign"),
              () => context.pushNamed(Routes.createCard.name, extra: card),
            ),
            _buildButton(context.tr("AddToTrainingList")),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, [void Function()? onTap]) => Expanded(
    child: SizedBox(
      height: double.infinity,
      child: GradientElevatedButton(
        onPressed: onTap,
        style: GradientElevatedButton.styleFrom(
          backgroundGradient: LinearGradient(
            colors: [
              Color.fromRGBO(202, 220, 246, 1),
              Color.fromRGBO(169, 171, 229, 1),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        child: Text(text, textAlign: TextAlign.center),
      ),
    ),
  );
}
