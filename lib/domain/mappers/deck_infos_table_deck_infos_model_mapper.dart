import 'package:drift/drift.dart';

import 'package:apprendre_lsf/domain/models/card_model/card_deck_infos.dart';
import 'package:apprendre_lsf/domain/database/drift_database.dart';

extension ExtensionCardDeckInfo on CardDeckInfo {
  CardDeckInfoTableCompanion toCompanion() => CardDeckInfoTableCompanion.insert(
    cardId: cardId,
    deckId: Value(deckId),
    retentionCard: retentionCard,
  );
}

extension ExtensionCardDeckInfoTable on CardDeckInfoTableData {
  CardDeckInfo toCardDeckInfo() => CardDeckInfo(
    cardId: cardId,
    deckId: deckId,
    retentionCard: retentionCard,
  );
}
