import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:go_router/go_router.dart';

import 'package:apprendre_lsf/domain/models/card_model/card_model.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning.dart';
import 'package:apprendre_lsf/domain/mappers/lsf_dictionnary_result_to_card_model_mapper.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/meaning_videos_signs_screen.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/meaning_videos_signs_viewmodel.dart';

class MeaningCardWithSign extends StatefulWidget {
  const MeaningCardWithSign(
      {super.key, required this.meaning, required this.isLastMeaning});
  final LsfDictionaryMeaning meaning;
  final bool isLastMeaning;

  @override
  State<MeaningCardWithSign> createState() => _MeaningCardWithSignState();
}

class _MeaningCardWithSignState extends State<MeaningCardWithSign> {
  // List<ChewieController> videoControllers = [];

  @override
  void initState() {
    _loadVideos();
    super.initState();
  }

  void _loadVideos() async {
    widget.meaning.wordSigns.forEach((media) async {
      final videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(media.videoUrl));
      await videoPlayerController.initialize();
    });
  }

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
                ListTile(title: Text(widget.meaning.definition)),
                _cardActions(context),
              ],
            ),
          ),
        ));
  }

  void _onCardTap() {
    showDialog(
        context: context,
        builder: (_) => MeaningVideosSignsScreen(
              viewModel: MeaningVideosSignsViewmodel(meaning: widget.meaning),
            ));
  }

  Widget _cardActions(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 8,
      children: <Widget>[
        _cardButton(context.tr("Deck"), Icons.add, () {
          //todo lire selectedDefinitionProvider ici
          LsfDictionarySearchResult? searchResult =
              context.read<ValueNotifier<LsfDictionarySearchResult?>>().value;
          // final searchResult = ref.read(selectedDefinitionProvider.notifier).state;
          if (searchResult != null) {
            CardModel card =
                cardModelFromMeaningOfResult(searchResult, widget.meaning);
            context.pushNamed(Routes.createCard.name, extra: card);
          }
        })
      ],
    );
  }

  Widget _cardButton(
    String text,
    IconData icon,
    Function() onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          spacing: 5,
          children: [
            Icon(icon),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class MeaningCardNoSign extends StatelessWidget {
  const MeaningCardNoSign(
      {super.key, required this.meaning, required this.isLastMeaning});
  final LsfDictionaryMeaning meaning;
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
                title: Text(meaning.definition,
                    style: TextStyle(color: Colors.grey)))
          ],
        ),
      ),
    );
  }
}
