import 'package:apprendre_lsf/ui/dictionaries/search/widgets/dictionaries_single_result.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/ui/core/centered_message.dart';
import 'package:apprendre_lsf/ui/core/empty.dart';
import 'package:apprendre_lsf/ui/core/customs_snackbars.dart';
import 'package:apprendre_lsf/data/repositories/dictionaries/lsf_dictionaries_providers.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/providers/dictionaries_search_provider.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/dictionaries_searchbar.dart';

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
      body: CustomScrollView(
        slivers: [
          DictionariesSearchbar(),
          searchResult.when(
            loading: () => _loadingIndicator(context),
            data: (data) {
              if (searchQuery.isEmpty) return _emptyQuery(context);
              if (data.isEmpty) return _noResults(context);

              return MultiSliver(
                children: data.map(DictionariesSingleResult.new).toList(),
              );
            },
            error: (error, stackTrace) => SliverToBoxAdapter(child: Empty()),
          ),
        ],
      ),
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
      debugPrintStack(stackTrace: result.stackTrace);
    }
  }
}
