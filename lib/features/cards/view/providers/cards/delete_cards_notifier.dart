import 'package:apprendre_lsf/global_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteCardNotifierProvider = AutoDisposeNotifierProvider(
  DeleteCardsNotifier.new,
);

class DeleteCardsNotifier extends AutoDisposeNotifier<AsyncValue<bool>> {
  @override
  AsyncValue<bool> build() => AsyncValue.data(false);

  Future call(List<int> cardsIds) async {
    try {
      state = AsyncLoading();
      await ref.watch(cardsRepositoryProvider).deleteCards(cardsIds: cardsIds);
      state = AsyncData(true);
    } catch (err, st) {
      state = AsyncError(err, st);
    }
  }
}
