import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';

enum DateFilter { recent, oldest }

class CardsFilter {
  const CardsFilter({this.dateFilter, this.retentionState, this.deck});

  final DateFilter? dateFilter;
  final RetentionState? retentionState;
  final DeckModel? deck;

  // bool cardMatchFilter(FullCard card) {

  // }
}
