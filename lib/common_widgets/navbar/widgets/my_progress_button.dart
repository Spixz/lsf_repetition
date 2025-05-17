import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

import 'package:apprendre_lsf/routing/routes_name.dart';

SpeedDialChild myProgressButton(BuildContext context) {
  return SpeedDialChild(
    child: const Icon(Icons.timeline),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
    label: context.tr("MyProgress"),
    visible: true,
    onTap: () async {
      Future.delayed(Duration(milliseconds: 200), () {
        if (context.mounted) {
          context.pushNamed(Routes.progress.name);
        }
      });
    },
  );
}
