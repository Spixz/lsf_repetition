import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning_with_parent.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/meaning_videos_signs_screen.dart';

class DictionariesSingleResultBodyWithSign extends StatefulWidget {
  const DictionariesSingleResultBodyWithSign({
    super.key,
    required this.scopedMeaning,
    required this.isLastMeaning,
  });
  final LsfDictionaryMeaningWithParent scopedMeaning;
  final bool isLastMeaning;

  @override
  State<DictionariesSingleResultBodyWithSign> createState() =>
      _DictionariesSingleResultBodyWithSignState();
}

class _DictionariesSingleResultBodyWithSignState
    extends State<DictionariesSingleResultBodyWithSign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.isLastMeaning ? 15 : 0),
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(11),
          onTap: _onCardTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _definition(),
              _Actions(scopedMeaning: widget.scopedMeaning),
            ],
          ),
        ),
      ),
    );
  }

  Widget _definition() =>
      ListTile(title: Text(widget.scopedMeaning.meaning.definition));

  void _onCardTap() {
    showDialog(
      context: context,
      builder:
          (_) => MeaningVideosSignsScreen(scopedMeaning: widget.scopedMeaning),
    );
  }
}

class _Actions extends ConsumerWidget {
  const _Actions({super.key, required this.scopedMeaning});

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

class DictionariesSingleResultBodyWithNoSign extends StatelessWidget {
  const DictionariesSingleResultBodyWithNoSign({
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
