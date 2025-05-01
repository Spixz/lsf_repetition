import 'package:apprendre_lsf/global_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteCardNotifierProvider = AutoDisposeNotifierProvider(
  DeleteCardsNotifier.new,
);

class DeleteCardsNotifier extends AutoDisposeNotifier<AsyncValue> {
  @override
  AsyncValue build() {
    return AsyncLoading();
  }

  Future call(List<int> cardsIds) async {
    try {
      await ref.watch(decksRepositoryProvider).deleteCards(cardsIds: cardsIds);
      state = AsyncData(null);
    } catch (err, st) {
      state = AsyncError(err, st);
    }
  }
}
