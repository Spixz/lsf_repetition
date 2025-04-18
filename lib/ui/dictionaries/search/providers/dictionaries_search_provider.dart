import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedSuggestionProvider = StateProvider<String>((ref) => '');

final dictionariesSearchQueryProvider =
    NotifierProvider<DictionariesSearchQueryNotifier, String>(
      DictionariesSearchQueryNotifier.new,
    );

class DictionariesSearchQueryNotifier extends Notifier<String> {
  Timer? timer;

  @override
  String build() => "";

  void update(String value, {Duration updateAfter = Duration.zero}) async {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }
    timer = Timer.periodic(updateAfter, (timer) {
      state = value;
      timer.cancel();
    });
  }
}
