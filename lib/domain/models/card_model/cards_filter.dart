import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cards_filter.freezed.dart';
part 'cards_filter.g.dart';

enum DateFilter { recent, oldest }

@freezed
class CardsFilter with _$CardsFilter {
  const factory CardsFilter({
    DateFilter? dateFilter,
    RetentionState? retentionState,
    DeckModel? deck,
  }) = _CardsFilter;

  factory CardsFilter.fromJson(Map<String, dynamic> json) =>
      _$CardsFilterFromJson(json);
}
