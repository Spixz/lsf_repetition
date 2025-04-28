import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/dialog_meaning_videos.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning_with_parent.dart';

/// A word or expression meaning with an available video to show its sign.
class MeaningCardBodyWithVideoSigns extends ConsumerWidget {
  const MeaningCardBodyWithVideoSigns({
    super.key,
    required this.scopedMeaning,
    required this.isLastMeaning,
  });
  final LsfDictionaryMeaningWithParent scopedMeaning;
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
            children: [
              _definition(),
              _ActionsList(scopedMeaning: scopedMeaning),
            ],
          ),
        ),
      ),
    );
  }

  Widget _definition() =>
      ListTile(title: Text(scopedMeaning.meaning.definition));

  void _onCardTap(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => DialogMeaningVideos(scopedMeaning: scopedMeaning),
    );
  }
}

class _ActionsList extends ConsumerWidget {
  const _ActionsList({super.key, required this.scopedMeaning});

  final LsfDictionaryMeaningWithParent scopedMeaning;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 8,
      children: <Widget>[
        _cardButton(context.tr("Deck"), Icons.add, () {
          context.pushNamed(
            Routes.createCard.name,
            extra: scopedMeaning.toCardModel,
          );
        }),
      ],
    );
  }

  Widget _cardButton(String text, IconData icon, Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: onPressed,
        child: Row(spacing: 5, children: [Icon(icon), Text(text)]),
      ),
    );
  }
}

/// A word or expression meaning with no video available for its sign yet.
class MeaningCardBodyWithoutVideoSigns extends StatelessWidget {
  const MeaningCardBodyWithoutVideoSigns({
    super.key,
    required this.scopedMeaning,
    required this.isLastMeaning,
  });
  final LsfDictionaryMeaningWithParent scopedMeaning;
  final bool isLastMeaning;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isLastMeaning ? 15 : 0),
      child: Card(
        color: Colors.grey.withValues(alpha: 230),
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                scopedMeaning.meaning.definition,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
