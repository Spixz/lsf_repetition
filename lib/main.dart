import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:apprendre_lsf/routing/router.dart';
import 'package:apprendre_lsf/core/scroll_behavior.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('fr'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('fr'),
      // child: ProviderScope(observers: [MyObserver()], child: MyApp()),
      child: ProviderScope(observers: [/*MyObserver()*/], child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      scrollBehavior: AppCustomScrollBehavior(),
      routerConfig: createRouter(),
    );
  }
}

// Future<List<SingleChildWidget>> createProviders() async {
//   final SupabaseRepository supabaseRepository = SupabaseRepository();
//   final AppDriftDatabase driftDatabase = AppDriftDatabase();

//   await supabaseRepository.initialize();

//   ValueNotifier<int> counter = ValueNotifier<int>(0);
//   return [
//     // ChangeNotifierProvider<SupabaseRepository>.value(value: supabaseRepository),
//   ];
// }
