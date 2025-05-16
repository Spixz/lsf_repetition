import 'package:apprendre_lsf/global_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              ref.read(driftDatabaseProvider).deleteTables();
            },
            child: Text("clear database"),
          ),
        ],
      ),
    );
  }
}
