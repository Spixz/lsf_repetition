import 'package:flutter/widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:apprendre_lsf/shared/domain/models/card/card.dart';
import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/features/cards/view/pages/create_card_screen.dart';
import 'package:apprendre_lsf/features/dictionaries/view/pages/dictionaries_search_screen.dart';
import 'package:apprendre_lsf/routing/route_provider.dart';
import 'package:apprendre_lsf/features/library/view/pages/library_screen.dart';
import 'package:apprendre_lsf/features/user_progress/view/pages/progress_screen.dart';
import 'package:apprendre_lsf/features/review_cards/view/pages/review_screen.dart';
import 'package:apprendre_lsf/features/settings/view/pages/settings_screen.dart';

final initialLocation = Routes.searchDictionariesResults;
// final initialLocation = Routes.progress;

GoRouter createRouter(WidgetRef ref) => GoRouter(
  initialLocation: initialLocation.path,
  debugLogDiagnostics: true,
  // observers: [MyNavigatorObserver(ref)],
  routes: [
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
        return const NoTransitionPage(child: LibraryScreen());
      },
    ),
    GoRoute(
      path: Routes.searchDictionariesResults.path,
      name: Routes.searchDictionariesResults.name,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: DictionariesSearchScreen());
      },
    ),
    GoRoute(
      path: Routes.review.path,
      name: Routes.review.name,
      builder: (context, state) {
        final title = state.pathParameters['title'] ?? context.tr("Review");
        return ReviewScreen(title: title);
      },
    ),
    GoRoute(
      path: Routes.progress.path,
      name: Routes.progress.name,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: ProgressScreen());
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
    return null;
  },
);
