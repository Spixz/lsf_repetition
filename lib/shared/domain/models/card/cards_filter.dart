import 'package:apprendre_lsf/shared/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cards_filter.freezed.dart';
part 'cards_filter.g.dart';

enum DateFilter { recent, oldest }

@freezed
class CardsFilter with _$CardsFilter {
  const CardsFilter._();
  const factory CardsFilter({
    @Default("") String name,
    DateFilter? dateFilter,
    RetentionState? retentionState,
    DeckModel? deck,
  }) = _CardsFilter;

  bool get hasActiveFilters =>
      [dateFilter, retentionState, deck].any((prop) => prop != null) ||
      name.isNotEmpty;

  bool get hasActiveFiltersExceptDeckAndName =>
      [dateFilter, retentionState].any((prop) => prop != null);

  factory CardsFilter.fromJson(Map<String, dynamic> json) =>
      _$CardsFilterFromJson(json);
}
