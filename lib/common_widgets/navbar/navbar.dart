import 'package:flutter/material.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:apprendre_lsf/utils/extensions/buildcontext_extension.dart';
import 'package:apprendre_lsf/routing/route_provider.dart';
import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/core/size.dart';

class MyBottomNavigationBar extends ConsumerWidget {
  MyBottomNavigationBar({super.key});

  final tabOrder = [
    Routes.searchDictionariesResults,
    Routes.library,
    Routes.progress,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actualRoute = ref.watch<SingleRoute>(actualRouteProvider);
    final actualRouteIndex = tabOrder.indexWhere(
      (route) => route == actualRoute,
    );
    final iconList = [
      Icons.travel_explore_rounded,
      Icons.menu_book,
    ];
    final iconColor = Color.fromRGBO(71, 67, 78, 1);
    final selectedColor = context.primaryColor;

    return AnimatedBottomNavigationBar.builder(
      height: navbarHeight,
      backgroundColor: Color.fromRGBO(243, 237, 248, 1),
      shadow: Shadow(
        color: Colors.black.withAlpha(12),
        offset: Offset(0, -3),
        blurRadius: 4,
      ),
      itemCount: iconList.length,
      tabBuilder: (int index, bool isActive) {
        return Icon(
          iconList[index],
          size: 27,
          color: isActive ? selectedColor : iconColor,
        );
      },
      activeIndex: actualRouteIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.smoothEdge,
      onTap: (index) => context.replaceNamed(tabOrder[index].name),
    );
  }
}
