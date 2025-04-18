import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/global_providers.dart';

final allDecksProvider = NotifierProvider(AllDeckNotifier.new);

class AllDeckNotifier extends Notifier<AsyncValue<List<DeckModel>>> {
  late StreamSubscription allDecksStreamSubcription;

  @override
  AsyncValue<List<DeckModel>> build() {
    final allDeckStream =
        ref.watch(decksRepositoryProvider).getAllDecksStream();
    allDecksStreamSubcription = allDeckStream.listen((data) {
      state = AsyncData(data);
    });
    ref.onDispose(dispose);
    return AsyncLoading();
  }

  void dispose() {
    allDecksStreamSubcription.cancel();
  }
}
