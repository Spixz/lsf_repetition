import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/routing/routes_name.dart';

final actualRouteProvider = StateProvider<SingleRoute>(
  (ref) => Routes.searchDictionariesResults,
);
