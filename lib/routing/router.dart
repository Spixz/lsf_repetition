import 'package:apprendre_lsf/ui/library/library_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/ui/cards/create/create_card_screen.dart';
import 'package:apprendre_lsf/ui/home/home_screen.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/dictionaries_search_screen.dart';
import 'package:apprendre_lsf/ui/library/list_cards_view.dart';
import 'package:apprendre_lsf/routing/route_provider.dart';

final initialLocation = Routes.searchDictionariesResults;

/// https://www.reddit.com/r/FlutterDev/comments/1in53yf/comment/mc84gse/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
GoRouter createRouter(WidgetRef ref) => GoRouter(
  initialLocation: initialLocation.path,
  debugLogDiagnostics: true,
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
        final Card card = state.extra as Card;
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
  ],
  redirect: (context, state) {
    final actualRoute = Routes.all.firstWhere(
      (route) => route.path == state.fullPath,
      orElse: () => initialLocation,
    );
    ref.read(actualRouteProvider.notifier).state = actualRoute;
  },
);
