import 'package:apprendre_lsf/domain/database/drift_database.dart';
import 'package:apprendre_lsf/domain/models/card_model/card.dart';

extension CardsTableDataToCard on CardsTableData {
  CardModel toCardModel() {
    return CardModel(
      id: id,
      name: name,
      typology: typology,
      meaning: meaning,
      videosSigns: videosSigns,
      sourceDictionnary: sourceDictionnary,
      dictionnarySignId: dictionnarySignId,
      createdAt: createdAt,
    );
  }
}

extension CardToCardsTableCompanion on CardModel {
  CardsTableCompanion toCompanion() {
    return CardsTableCompanion.insert(
      name: name,
      typology: typology,
      meaning: meaning,
      videosSigns: videosSigns,
      sourceDictionnary: sourceDictionnary,
      //todo : pb avec dictionnarySignId
    );
  }
}
