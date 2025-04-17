import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/meaning_cards.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning_with_parent.dart';

/// Display the title and the definiton of the result [LsfDictionarySearchResult].
/// A click on a definition open a layer with the videos availaible for
/// the definition.
class DictionariesSingleResult extends ConsumerWidget {
  const DictionariesSingleResult(this.result, {super.key});
  final LsfDictionarySearchResult result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStickyHeader.builder(
      builder:
          (_, state) => DictionariesSingleResultHeader(
            result: result,
            stickyHeaderState: state,
          ),
      sliver: _buildMeaningCardsList(result.meanings),
    );
  }

  Widget _buildMeaningCardsList(List<LsfDictionaryMeaning> meanings) {
    return SliverList.builder(
      itemCount: result.meanings.length,
      itemBuilder: (_, index) {
        final meaning = result.meanings[index];
        final isLastMeaning = index == result.meanings.length - 1;
        final scopedMeaning = LsfDictionaryMeaningWithParent(
          parent: result,
          meaning: meaning,
        );

        if (meaning.wordSigns.isEmpty) {
          return MeaningCardBodyWithoutVideoSigns(
            scopedMeaning: scopedMeaning,
            isLastMeaning: isLastMeaning,
          );
        }
        return MeaningCardBodyWithVideoSigns(
          scopedMeaning: scopedMeaning,
          isLastMeaning: isLastMeaning,
        );
      },
    );
  }
}

class DictionariesSingleResultHeader extends StatelessWidget {
  const DictionariesSingleResultHeader({
    super.key,
    required this.result,
    required this.stickyHeaderState,
  });
  final LsfDictionarySearchResult result;
  final SliverStickyHeaderState stickyHeaderState;

  @override
  Widget build(BuildContext context) {
    final bool isPinned = stickyHeaderState.isPinned;
    // return Container(
    //   height: 60.0,
    //   color: (stickyHeaderState.isPinned ? Colors.pink : null),
    //   padding: EdgeInsets.symmetric(horizontal: 16.0),
    //   alignment: Alignment.centerLeft,
    //   child: Text(
    //     "${word.name} ${word.typology}",
    //     style: const TextStyle(color: Colors.black),
    //   ),
    // );
    return TweenAnimationBuilder<Color?>(
      // Si c'est pinned, on va aller vers Colors.pink,
      // sinon, on va vers Colors.transparent (ou une autre couleur).
      tween: ColorTween(
        begin: null,
        end: isPinned ? Colors.pink : Colors.transparent,
      ),
      duration: const Duration(milliseconds: 300),
      builder: (context, color, child) {
        return Container(
          height: 60.0,
          color: color,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "${result.name} (${result.typology})",
            style: TextStyle(color: Colors.black, fontSize: isPinned ? 15 : 18),
          ),
        );
      },
    );
  }
}
