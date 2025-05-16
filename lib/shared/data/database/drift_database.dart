import 'package:path_provider/path_provider.dart';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'package:apprendre_lsf/features/dictionaries/domain/models/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';

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

class CardsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get deckId => integer().nullable()();
  TextColumn get name => text().withLength(min: 1)();
  TextColumn get typology => text().withLength(min: 1)();
  TextColumn get meaning => text().withLength(min: 1)();
  TextColumn get videosSigns => text().map(ListString.converter)();
  IntColumn get sourceDictionnary => intEnum<LsfDictionaryName>()();
  IntColumn get dictionnarySignId => integer().nullable()();
  TextColumn get tags =>
      text().map(ListString.converter).clientDefault(() => "[]").nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@TableIndex(name: 'card_id', columns: {#cardId})
class RetentionTable extends Table {
  IntColumn get cardId =>
      integer().references(CardsTable, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get due => dateTime()();
  DateTimeColumn get lastReview => dateTime()();
  RealColumn get stability => real().clientDefault(() => 0.0)();
  RealColumn get difficulty => real().clientDefault(() => 0.0)();
  IntColumn get elapsedDays => integer().clientDefault(() => 0)();
  IntColumn get scheduledDays => integer().clientDefault(() => 0)();
  IntColumn get reps => integer().clientDefault(() => 0)();
  IntColumn get lapses => integer().clientDefault(() => 0)();
  IntColumn get state =>
      intEnum<RetentionState>().clientDefault(
        () => RetentionState.newState.index,
      )();
}

//nullable()();

@DriftDatabase(tables: [DecksTable, CardsTable, RetentionTable])
class AppDriftDatabase extends _$AppDriftDatabase {
  AppDriftDatabase() : super(_openConnection());
  AppDriftDatabase.executor(QueryExecutor super.e);

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'drift_database',
      native: DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON;');
    },
  );

  void deleteTables() async {
    final tables = allTables.toList().reversed;
    for (final table in tables) {
      await delete(table).go();
    }
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
