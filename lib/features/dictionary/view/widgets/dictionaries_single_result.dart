import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/features/dictionary/view/widgets/meaning/meaning_cards_without_video.dart';
import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_meaning.dart';
import 'package:apprendre_lsf/shared/domain/models/card/full_card_mapper.dart';
import 'package:apprendre_lsf/features/dictionary/view/widgets/meaning/meaning_cards_with_video.dart';

/// Displays a card representing one dictionary search result.
///
/// A search returns a list of [LsfDictionarySearchResult]. This can be a word
/// or expression with multiple definitions.
///
/// For example, searching for 'brillant' returns:
/// - Brillant (adjective)      (_SingleResultHeader)
///   => That shines            (MeaningCardBodyWithVideoSigns)
/// - Brillant (verb)
///   => Reflect light
///   => Stand out
///
/// Clicking a definition opens a layer with the available videos.
class DictionariesSingleResult extends ConsumerWidget {
  const DictionariesSingleResult(this.result, {super.key});
  final LsfDictionarySearchResult result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStickyHeader.builder(
      builder:
          (_, state) =>
              _SingleResultHeader(result: result, stickyHeaderState: state),
      sliver: _buildMeaningCardsList(result.meanings),
    );
  }

  Widget _buildMeaningCardsList(List<LsfDictionaryMeaning> meanings) {
    return SliverList.builder(
      itemCount: result.meanings.length,
      itemBuilder: (_, index) {
        final meaning = result.meanings[index];
        final isLastMeaning = index == result.meanings.length - 1;
        final fullCard = FullCardMapper.fromLsfDictionnaryResults(
          searchOutput: result,
          selectedMeaning: meaning,
        );

        if (meaning.wordSigns.isEmpty) {
          return MeaningCardBodyWithoutVideoSigns(
            fullCard: fullCard,
            isLastMeaning: isLastMeaning,
          );
        }
        return MeaningCardBodyWithVideoSigns(
          fullCard: fullCard,
          isLastMeaning: isLastMeaning,
        );
      },
    );
  }
}

class _SingleResultHeader extends StatelessWidget {
  const _SingleResultHeader({
    required this.result,
    required this.stickyHeaderState,
  });
  final LsfDictionarySearchResult result;
  final SliverStickyHeaderState stickyHeaderState;

  @override
  Widget build(BuildContext context) {
    // final bool isPinned = stickyHeaderState.isPinned;§

    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(
        begin: null,
        // end: Color.fromRGBO(211, 189, 245, 1),
        end: Color.fromRGBO(234, 221, 255, 1),
        // end: isPinned ? Color.fromRGBO(211, 189, 245, 1) : Colors.transparent,
      ),
      duration: const Duration(milliseconds: 300),
      builder: (context, color, child) {
        return Container(
          height: 60.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "${result.name} (${result.typology})",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        );
      },
    );
  }
}
