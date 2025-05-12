import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:apprendre_lsf/data/repositories/dictionaries/lsf_dictionaries_providers.dart';
import 'package:apprendre_lsf/ui/core/empty.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/providers/dictionaries_search_provider.dart';
import 'package:apprendre_lsf/core/scroll_behavior.dart';
import 'package:apprendre_lsf/ui/core/centered_message.dart';

class DictionariesSearchbar extends ConsumerWidget {
  const DictionariesSearchbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      clipBehavior: Clip.none,
      shape: const StadiumBorder(),
      scrolledUnderElevation: 0.0,
      titleSpacing: 0.0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: SearchAnchor.bar(
          viewHintText: context.tr("Search"),
          onChanged:
              (value) => ref
                  .read(dictionariesSearchQueryProvider.notifier)
                  .update(value, updateAfter: Duration(milliseconds: 800)),
          isFullScreen: true,
          viewBuilder:
              (suggestions) =>
                  ListView(children: [_SearchBarFilters(), ...suggestions]),
          suggestionsBuilder:
              (context, controller) async => [
                SuggestionList(controller: controller),
              ],
        ),
      ),
    );
  }
}

class _SearchBarFilters extends StatelessWidget {
  const _SearchBarFilters({super.key});

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

class SuggestionList extends ConsumerWidget {
  const SuggestionList({super.key, required this.controller});
  final SearchController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(dictionariesSearchQueryProvider);
    if (searchQuery.isEmpty) return Empty();
    final results = ref.watch(
      searchDefinitionHintsResultsProvider(searchQuery),
    );

    return results.when(
      data: (data) {
        final hintTiles = data.map(
          (result) => ListTile(
            title: Text(result.word),
            onTap: () {
              ref.read(selectedSuggestionProvider.notifier).state = result.word;
              controller.closeView(result.word);
              Future.delayed(Duration(milliseconds: 0), () {
                FocusManager.instance.primaryFocus?.unfocus();
              });
            },
          ),
        );
        return Column(children: hintTiles.toList());
      },
      error:
          (_, __) => Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CenteredMessage(message: context.tr("ErrorHintsSearch")),
          ),
      loading:
          () => Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CenteredMessage(message: context.tr("Loading")),
          ),
    );
  }
}
