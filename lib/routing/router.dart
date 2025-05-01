import 'package:apprendre_lsf/ui/settings/settings_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/ui/cards/create/create_card_screen.dart';
import 'package:apprendre_lsf/ui/home/home_screen.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/dictionaries_search_screen.dart';
import 'package:apprendre_lsf/routing/route_provider.dart';
import 'package:apprendre_lsf/ui/library/library_screen.dart';

final initialLocation = Routes.searchDictionariesResults;
// final initialLocation = Routes.library;

GoRouter createRouter(WidgetRef ref) => GoRouter(
  initialLocation: initialLocation.path,
  debugLogDiagnostics: true,
  // observers: [MyNavigatorObserver(ref)],
  routes: [
    GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: Routes.createCard.path,
      name: Routes.createCard.name,
      builder: (context, state) {
        final CardModel card = state.extra as CardModel;
        return CreateCardScreen(cardToCreate: card);
      },
    ),
    GoRoute(
      path: Routes.library.path,
      name: Routes.library.name,
      pageBuilder: (context, state) {
        return NoTransitionPage(child: LibraryScreen());
      },
    ),
    GoRoute(
      path: Routes.searchDictionariesResults.path,
      name: Routes.searchDictionariesResults.name,
      pageBuilder: (context, state) {
        return NoTransitionPage(child: DictionariesSearchScreen());
      },
    ),
    GoRoute(
      path: Routes.settings.path,
      name: Routes.settings.name,
      builder: (context, state) {
        return const SettingsScreen();
      },
    ),
  ],
  redirect: (context, state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final actualRoute = Routes.all.firstWhere(
        (route) => route.path == state.fullPath,
        orElse: () => initialLocation,
      );
      ref.read(actualRouteProvider.notifier).state = actualRoute;
    });
  },
);
