
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/shared/domain/models/card/cards_filter.dart';
import 'package:apprendre_lsf/shared/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';

final cardsFilterProvider = NotifierProvider<CardsFilterNotifier, CardsFilter>(
  CardsFilterNotifier.new,
  name: "Cards Filter Provider",
);

class CardsFilterNotifier extends Notifier<CardsFilter> {
  @override
  CardsFilter build() => CardsFilter();

  Timer? _timer;

  void updateName(String value) {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(
      Duration(milliseconds: 300),
      (_) => state = state.copyWith(name: value),
    );
  }

  void updateDateFilter(DateFilter? date) =>
      state = state.copyWith(dateFilter: date);

  void updateRetentionState(RetentionState? retention) =>
      state = state.copyWith(retentionState: retention);

  void updateDeck(DeckModel? deck) => state = state.copyWith(deck: deck);

  void clear() => ref.invalidateSelf();

  void copyFrom(CardsFilter filter) => state = filter;
}