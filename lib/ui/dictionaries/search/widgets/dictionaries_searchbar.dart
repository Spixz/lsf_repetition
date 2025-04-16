
import 'package:apprendre_lsf/data/repositories/dictionaries/lsf_dictionaries_providers.dart';
import 'package:apprendre_lsf/ui/core/ui/empty.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/providers/dictionaries_search_provider.dart';
import 'package:flutter/material.dart';

import 'package:apprendre_lsf/ui/core/scroll_behavior.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictionariesSearchbar extends ConsumerWidget {
  DictionariesSearchbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      clipBehavior: Clip.none,
      shape: const StadiumBorder(),
      scrolledUnderElevation: 0.0,
      titleSpacing: 0.0,
      backgroundColor: Colors.transparent,
      floating: true,
      title: SearchAnchor.bar(
        viewHintText: 'Search',
        onChanged:
            (value) => ref
                .read(dictionariesSearchQueryProvider.notifier)
                .update(value, updateAfter: Duration(milliseconds: 800)),
        isFullScreen: true,
        viewBuilder:
            (suggestions) =>
                ListView(children: [_SearchBarFilters(), ...suggestions]),
        suggestionsBuilder:
            (context, controller) => [SuggestionList(controller: controller)],
      ),
    );
  }
}

class SuggestionList extends ConsumerWidget {
  const SuggestionList({super.key, required this.controller});
  final SearchController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(dictionariesSearchQueryProvider);
    if (searchQuery.isEmpty) return Empty();
    final results = ref.watch(searchDefinitionHintsResultsProvider(searchQuery));

    return Column(
      children: [
        ...results.when(
          data: (data) {
            return data
                .map(
                  (result) => ListTile(
                    title: Text(result.word),
                    onTap: () {
                      ref.read(selectedSuggestionProvider.notifier).state =
                          result.word;
                      FocusManager.instance.primaryFocus?.unfocus();
                      controller.closeView(result.word);
                    },
                  ),
                )
                .toList();
          },
          error: (error, stackTrace) => [Text('error')],
          loading: () => [Text("loading")],
        ),
      ],
    );
  }
}

class _SearchBarFilters extends StatelessWidget {
  const _SearchBarFilters();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: ScrollConfiguration(
        behavior: AppCustomScrollBehavior(),
        child: const SingleChildScrollView(
          padding: EdgeInsets.only(left: 8, top: 8),
          scrollDirection: Axis.horizontal,
          physics: AlwaysScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          child: Row(
            spacing: 4,
            children: [
              ChoiceChip(label: Text('Elix'), selected: true),
              ChoiceChip(label: Text('SpreadTheSign'), selected: false),
            ],
          ),
        ),
      ),
    );
  }
}
