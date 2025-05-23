import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/common_widgets/common_widgets_export.dart';
import 'package:apprendre_lsf/features/dictionary/view/widgets/dictionaries_searchbar.dart';
import 'package:apprendre_lsf/features/dictionary/view/widgets/dictionaries_single_result.dart';
import 'package:apprendre_lsf/features/dictionary/view/providers/selected_suggestion_provider.dart';
import 'package:apprendre_lsf/features/dictionary/data/providers/search_definition_result_provider.dart';

/// Dictionary search page.
///
/// Displays a search bar with results listed below.
class DictionariesSearchScreen extends ConsumerWidget {
  const DictionariesSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch<String>(selectedSuggestionProvider);
    final searchResult = ref.watch<AsyncValue<List<LsfDictionarySearchResult>>>(
      searchDefinitionResultsProvider(searchQuery),
    );

    ref.listen(
      searchDefinitionResultsProvider(searchQuery),
      (_, result) => _onSearchError(context, result),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 6, top: 8, right: 6),
          child: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              DictionariesSearchbar(),
              searchResult.when(
                loading: () => _loadingIndicator(context),
                data: (data) {
                  if (searchQuery.isEmpty) return _emptyQuery(context);
                  if (data.isEmpty) return _noResults(context);

                  return MultiSliver(
                    children: [
                      SliverToBoxAdapter(child: SizedBox(height: 10)),
                      ...data.map(DictionariesSingleResult.new),
                    ],
                  );
                },
                error:
                    (error, stackTrace) => SliverToBoxAdapter(child: Empty()),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: NavbarCentralButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  Widget _loadingIndicator(BuildContext context) {
    return SliverFillRemaining(
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _emptyQuery(BuildContext context) {
    return SliverFillRemaining(
      child: CenteredMessage(message: context.tr("makeASearch")),
    );
  }

  Widget _noResults(BuildContext context) {
    return SliverFillRemaining(
      child: CenteredMessage(message: context.tr("noResults")),
    );
  }

  void _onSearchError(
    BuildContext context,
    AsyncValue<List<LsfDictionarySearchResult>> result,
  ) {
    if (result.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        ErrorSnackbar(message: context.tr("unexpectedErrorHasOccurred")),
      );
      debugPrint(result.error.toString());
      debugPrint(result.stackTrace.toString());
    }
  }
}
