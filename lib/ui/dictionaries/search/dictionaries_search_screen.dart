import 'package:apprendre_lsf/data/repositories/dictionaries/lsf_dictionaries_providers.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/providers/dictionaries_search_provider.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/dictionaries_searchbar.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/ui/core/ui/centered_message.dart';
import 'package:apprendre_lsf/ui/core/ui/empty.dart';
import 'package:apprendre_lsf/ui/core/ui/customs_snackbars.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/meaning_card.dart';

class DictionariesSearchScreen extends ConsumerWidget {
  const DictionariesSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(selectedSuggestionProvider);
    final searchResult = ref.watch(
      searchDefinitionResultsProvider(searchQuery),
    );

    ref.listen(searchDefinitionResultsProvider(searchQuery), (_, search) {
      if (search.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          ErrorSnackbar(message: context.tr("unexpectedErrorHasOccurred")),
        );
        debugPrint(search.error.toString());
        debugPrintStack(stackTrace: search.stackTrace);
      }
    });

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DictionariesSearchbar(),
          searchResult.when(
            loading: () => _buildLoadingIndicator(context),
            data: (data) {
              if (searchQuery.isEmpty) return _buildEmptyQuery(context);
              if (data.isEmpty) return _buildNoResults(context);
              return _createSearchResults(context, ref, data);
            },
            error: (error, stackTrace) => SliverToBoxAdapter(child: Empty()),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return SliverFillRemaining(
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildNoResults(BuildContext context) {
    return SliverFillRemaining(
      child: CenteredMessage(message: context.tr("noResults")),
    );
  }

  Widget _buildEmptyQuery(BuildContext context) {
    return SliverFillRemaining(
      child: CenteredMessage(message: context.tr("makeASearch")),
    );
  }

  Widget _createSearchResults(
    BuildContext context,
    WidgetRef ref,
    List<LsfDictionarySearchResult> words,
  ) {
    final definitionSlivers = words.map<SliverStickyHeader>(
      (word) => _createSingleResult(context, ref, word),
    );
    return MultiSliver(children: definitionSlivers.toList());
  }

  Listener _meaningCardWrapper(
    BuildContext context,
    WidgetRef ref,
    LsfDictionarySearchResult word,
    Widget child,
  ) {
    return Listener(
      onPointerDown:
          (event) => ref.read(selectedDefinitionProvider.notifier).state = word,
      child: child,
    );
  }

  SliverStickyHeader _createSingleResult(
    BuildContext context,
    WidgetRef ref,
    LsfDictionarySearchResult word,
  ) {
    return SliverStickyHeader.builder(
      builder:
          (context, state) => WordHeader(word: word, stickyHeaderState: state),
      sliver: SliverList.builder(
        itemCount: word.meanings.length,
        itemBuilder: (_, index) {
          if (word.meanings[index].wordSigns.isEmpty) {
            return _meaningCardWrapper(
              context,
              ref,
              word,
              MeaningCardNoSign(
                meaning: word.meanings[index],
                isLastMeaning: index == word.meanings.length - 1,
              ),
            );
          }
          return _meaningCardWrapper(
            context,
            ref,
            word,
            MeaningCardWithSign(
              meaning: word.meanings[index],
              isLastMeaning: index == word.meanings.length - 1,
            ),
          );
        },
      ),
    );
  }
}

class WordHeader extends StatelessWidget {
  const WordHeader({
    super.key,
    required this.word,
    required this.stickyHeaderState,
  });
  final LsfDictionarySearchResult word;
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
            "${word.name} (${word.typology})",
            style: TextStyle(color: Colors.black, fontSize: isPinned ? 15 : 18),
          ),
        );
      },
    );
  }
}
