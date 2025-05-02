import 'package:apprendre_lsf/data/repositories/decks/deck_repository_provider.dart';
import 'package:apprendre_lsf/ui/library/providers/library_on_dispose_provider.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/routing/navigation_bar.dart';
import 'package:apprendre_lsf/ui/library/list_cards_view.dart';
import 'package:apprendre_lsf/ui/library/list_deck_view.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Tab> myTabs = <Tab>[
      Tab(text: context.tr("Decks")),
      Tab(text: context.tr("Cards")),
    ];
    ref.watch(libraryOnDisposeProvider);

    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: TabBarView(children: [ListDecksView(), ListCardsView()]),
            ),
            TabBar(
              tabs: myTabs,
              onTap: (index) {
                if (index == LibraryTab.decks.index) {
                  ref.read(cardsFilterProvider.notifier).updateDeck(null);
                }
              },
            ),
          ],
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}
