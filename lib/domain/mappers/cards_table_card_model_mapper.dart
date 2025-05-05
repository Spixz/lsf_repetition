import 'package:drift/drift.dart';

import 'package:apprendre_lsf/domain/database/drift_database.dart';
import 'package:apprendre_lsf/domain/models/card_model/card.dart';

extension CardsTableDataToCard on CardsTableData {
  CardModel toCardModel() {
    return CardModel(
      id: id,
      deckId: deckId,
      name: name,
      typology: typology,
      meaning: meaning,
      videosSigns: videosSigns,
      sourceDictionnary: sourceDictionnary,
      dictionnarySignId: dictionnarySignId,
      tags: tags,
      createdAt: createdAt,
    );
  }
}

extension CardToCardsTableCompanion on CardModel {
  CardsTableCompanion toCompanion() {
    return CardsTableCompanion.insert(
      name: name,
      deckId: Value(deckId),
      typology: typology,
      meaning: meaning,
      videosSigns: videosSigns,
      sourceDictionnary: sourceDictionnary,
      tags: Value(tags),
      //todo : pb avec dictionnarySignId
    );
  }
}
