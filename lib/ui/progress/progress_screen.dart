import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("Progress screen"),
      // floatingActionButton: NavbarCentralButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
