import 'package:apprendre_lsf/shared/data/database/drift_database.dart';
import 'package:apprendre_lsf/shared/domain/models/deck/deck_model.dart';

extension DeckTableDataExtension on DecksTableData {
  DeckModel get toDeckModel => DeckModel(
    id: id,
    name: name,
    description: description,
    createdAt: createdAt,
  );
}

extension DeckModelExtension on DeckModel {
  DecksTableCompanion get toCompanion =>
      DecksTableCompanion.insert(name: name, description: description);
  // static DeckModel fromDecksTableData(DecksTableData data) =>
  //     data.toDeckModel();
}
