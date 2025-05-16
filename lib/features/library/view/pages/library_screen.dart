import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/features/common_widgets/navbar/navbar.dart';
import 'package:apprendre_lsf/features/library/view/widgets/list_cards_view.dart';
import 'package:apprendre_lsf/features/library/view/providers/library_on_dispose_provider.dart';
import 'package:apprendre_lsf/features/common_widgets/navbar/navbar_central_button.dart';
import 'package:apprendre_lsf/utils/extensions/buildcontext_extension.dart';
import 'package:apprendre_lsf/features/library/view/providers/card_filter_notifier.dart';
import 'package:apprendre_lsf/features/library/view/widgets/list_deck_view.dart';

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
      initialIndex: 1,
      length: myTabs.length,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: TabBarView(children: [ListDecksView(), ListCardsView()]),
              ),
              TabBar(
                tabs: myTabs,
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                dividerHeight: 0,
                onTap: (index) {
                  if (index == LibraryTab.decks.index) {
                    ref.read(cardsFilterProvider.notifier).updateDeck(null);
                  }
                },
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.0, color: context.primaryColor),
                  insets: EdgeInsets.fromLTRB(0, 0.0, 0.0, 45.0),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: NavbarCentralButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}
