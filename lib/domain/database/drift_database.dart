import 'package:apprendre_lsf/domain/database/converters/retention_card_converters.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';
import 'package:path_provider/path_provider.dart';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';

part 'drift_database.g.dart';

extension ListString on List<String> {
  static JsonTypeConverter2<List<String>, String, Object?> converter =
      TypeConverter.json2(
        fromJson:
            (Object? json) =>
                (json as List<dynamic>).whereType<String>().toList(),
        toJson: (List<String> strList) => strList,
      );
}

class DecksTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 32)();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@TableIndex(name: 'deck_id', columns: {#deckId})
class CardsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get deckId =>
      integer().references(DecksTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text().withLength(min: 1)();
  TextColumn get typology => text().withLength(min: 1)();
  TextColumn get meaning => text().withLength(min: 1)();
  TextColumn get videosSigns => text().map(ListString.converter)();
  IntColumn get sourceDictionnary => intEnum<LsfDictionaryName>()();
  IntColumn get dictionnarySignId => integer()();
  TextColumn get tags =>
      text().map(ListString.converter).clientDefault(() => "[]")();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  // TextColumn get retentionCard => text().map(const RetentionCardConverter())();
}

//nullable()();

@DriftDatabase(tables: [DecksTable, CardsTable])
class AppDriftDatabase extends _$AppDriftDatabase {
  AppDriftDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'drift_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}


//======================================================

/*
class TestDriftJson {
  final bool dailyNewsletter;
  final String theme;

  TestDriftJson(this.dailyNewsletter, this.theme);

  factory TestDriftJson.fromJson(Map<String, dynamic> json) {
    return TestDriftJson(
      json['dailyNewsletter'] as bool,
      json['theme'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dailyNewsletter': dailyNewsletter,
      'theme': theme,
    };
  }
}

class TestDriftJsonConverter extends TypeConverter<TestDriftJson, String>
    with JsonTypeConverter2<TestDriftJson, String, Map<String, dynamic>> {
  @override
  TestDriftJson fromSql(String fromDb) {
    return TestDriftJson.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(TestDriftJson value) {
    return jsonEncode(value.toJson());
  }
  //Le truc c'est que la flemme de défnir fromSql et toSql.
  //Ils les ont donc définis à partir de From et To Json.
  //Ce qui donne la classe _DefaultJsonConverter

  TestDriftJson fromSql2(String fromDb) {
    return fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  String toSql2(TestDriftJson value) {
    return jsonEncode(toJson(value));
  }

  @override
  Map<String, dynamic> toJson(TestDriftJson value) {
    return value.toJson();
  }

  @override
  TestDriftJson fromJson(Map<String, dynamic> json) {
    return TestDriftJson.fromJson(json);
  }
}

*/