import 'package:apprendre_lsf/domain/database/drift_database.dart';
import 'package:apprendre_lsf/domain/models/card_model/card_model.dart';

extension CardsTableDataToCardModel on CardsTableData {
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
        createdAt: createdAt);
  }
}

extension CardModelToCardsTableCompanion on CardModel {
  CardsTableCompanion toCompanion() {
    return CardsTableCompanion.insert(
        deckId: deckId ?? -1,
        name: name,
        typology: typology,
        meaning: meaning,
        videosSigns: videosSigns,
        sourceDictionnary: sourceDictionnary,
        dictionnarySignId: dictionnarySignId ?? -1);
  }
}
