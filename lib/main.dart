import 'package:apprendre_lsf/utils/provider_observer.dart';
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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      scrollBehavior: AppCustomScrollBehavior(),
      routerConfig: createRouter(ref),
    );
  }
}
