import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/features/dictionary/view/widgets/meaning/videos_dialog/dialog_meaning_videos.dart';
import 'package:apprendre_lsf/shared/domain/models/card/card.dart';
import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';

/// A word or expression meaning with an available video to show its sign.
class MeaningCardBodyWithVideoSigns extends ConsumerWidget {
  const MeaningCardBodyWithVideoSigns({
    super.key,
    required this.fullCard,
    required this.isLastMeaning,
  });
  final FullCard fullCard;
  final bool isLastMeaning;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(bottom: isLastMeaning ? 15 : 0),
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(11),
          onTap: () => _onCardTap(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [_definition(), _ActionsList(card: fullCard.card)],
          ),
        ),
      ),
    );
  }

  Widget _definition() => ListTile(title: Text(fullCard.card.name));

  void _onCardTap(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => DialogMeaningVideos(fullcard: fullCard),
    );
  }
}

class _ActionsList extends ConsumerWidget {
  const _ActionsList({required this.card});

  final CardModel card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 8,
      children: <Widget>[
        _cardButton(context.tr("MyCards"), Icons.add, () {
          context.pushNamed(Routes.createCard.name, extra: card);
        }),
      ],
    );
  }

  Widget _cardButton(String text, IconData icon, Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: onPressed,
        child: Row(spacing: 5, children: [Icon(icon, size: 23), Text(text)]),
      ),
    );
  }
}

