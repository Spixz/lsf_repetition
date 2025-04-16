import 'package:apprendre_lsf/domain/database/drift_database.dart';
import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';

extension DeckTableDataToDeckModel on DecksTableData {
  DeckModel toDeckModel() {
    return DeckModel(
        id: id, name: name, description: description, createdAt: createdAt);
  }
}

extension DeckModelToDecksTableCompanion on DeckModel {
  DecksTableCompanion toCompanion() {
    return DecksTableCompanion.insert(name: name, description: description);
  }
}
