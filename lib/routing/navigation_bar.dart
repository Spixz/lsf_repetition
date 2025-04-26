import 'package:apprendre_lsf/routing/route_provider.dart';
import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyBottomNavigationBar extends ConsumerWidget {
  MyBottomNavigationBar({super.key});

  final _tabOrder = [Routes.searchDictionariesResults, Routes.library];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actualRoute = ref.watch<SingleRoute>(actualRouteProvider);
    final destinationIndex = _tabOrder.indexWhere(
      (route) => route == actualRoute,
    );

    return NavigationBar(
      selectedIndex: (destinationIndex == -1) ? 0 : destinationIndex,
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.travel_explore_rounded),
          label: context.tr("Search"),
        ),
        NavigationDestination(
          icon: Icon(Icons.library_books),
          label: context.tr("MyCards"),
        ),
      ],
      onDestinationSelected:
          (index) => context.replaceNamed(_tabOrder[index].name),
    );
  }
}
