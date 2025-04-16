import 'dart:async';

import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedSuggestionProvider = StateProvider<String>((ref) => '');

final selectedDefinitionProvider = StateProvider<LsfDictionarySearchResult?>(
  (ref) => null,
);

final dictionariesSearchQueryProvider =
    NotifierProvider<DictionariesSearchQueryNotifier, String>(
      DictionariesSearchQueryNotifier.new,
    );

class DictionariesSearchQueryNotifier extends Notifier<String> {
  Timer? timer;

  @override
  String build() {
    return "";
  }

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
