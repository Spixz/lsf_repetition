// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $DecksTableTable extends DecksTable
    with TableInfo<$DecksTableTable, DecksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'decks_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DecksTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DecksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DecksTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $DecksTableTable createAlias(String alias) {
    return $DecksTableTable(attachedDatabase, alias);
  }
}

class DecksTableData extends DataClass implements Insertable<DecksTableData> {
  final int id;
  final String name;
  final String description;
  final DateTime createdAt;
  const DecksTableData({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DecksTableCompanion toCompanion(bool nullToAbsent) {
    return DecksTableCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory DecksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DecksTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DecksTableData copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? createdAt,
  }) => DecksTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
  );
  DecksTableData copyWithCompanion(DecksTableCompanion data) {
    return DecksTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DecksTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DecksTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class DecksTableCompanion extends UpdateCompanion<DecksTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> createdAt;
  const DecksTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DecksTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       description = Value(description);
  static Insertable<DecksTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DecksTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<DateTime>? createdAt,
  }) {
    return DecksTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecksTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CardsTableTable extends CardsTable
    with TableInfo<$CardsTableTable, CardsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _deckIdMeta = const VerificationMeta('deckId');
  @override
  late final GeneratedColumn<int> deckId = GeneratedColumn<int>(
    'deck_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES decks_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typologyMeta = const VerificationMeta(
    'typology',
  );
  @override
  late final GeneratedColumn<String> typology = GeneratedColumn<String>(
    'typology',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _meaningMeta = const VerificationMeta(
    'meaning',
  );
  @override
  late final GeneratedColumn<String> meaning = GeneratedColumn<String>(
    'meaning',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
  videosSigns = GeneratedColumn<String>(
    'videos_signs',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<List<String>>($CardsTableTable.$convertervideosSigns);
  @override
  late final GeneratedColumnWithTypeConverter<LsfDictionaryName, int>
  sourceDictionnary = GeneratedColumn<int>(
    'source_dictionnary',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  ).withConverter<LsfDictionaryName>(
    $CardsTableTable.$convertersourceDictionnary,
  );
  static const VerificationMeta _dictionnarySignIdMeta = const VerificationMeta(
    'dictionnarySignId',
  );
  @override
  late final GeneratedColumn<int> dictionnarySignId = GeneratedColumn<int>(
    'dictionnary_sign_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>(
        'tags',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        clientDefault: () => "[]",
      ).withConverter<List<String>>($CardsTableTable.$convertertags);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    deckId,
    name,
    typology,
    meaning,
    videosSigns,
    sourceDictionnary,
    dictionnarySignId,
    tags,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cards_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CardsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('deck_id')) {
      context.handle(
        _deckIdMeta,
        deckId.isAcceptableOrUnknown(data['deck_id']!, _deckIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deckIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('typology')) {
      context.handle(
        _typologyMeta,
        typology.isAcceptableOrUnknown(data['typology']!, _typologyMeta),
      );
    } else if (isInserting) {
      context.missing(_typologyMeta);
    }
    if (data.containsKey('meaning')) {
      context.handle(
        _meaningMeta,
        meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta),
      );
    } else if (isInserting) {
      context.missing(_meaningMeta);
    }
    if (data.containsKey('dictionnary_sign_id')) {
      context.handle(
        _dictionnarySignIdMeta,
        dictionnarySignId.isAcceptableOrUnknown(
          data['dictionnary_sign_id']!,
          _dictionnarySignIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dictionnarySignIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CardsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardsTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      deckId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}deck_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      typology:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}typology'],
          )!,
      meaning:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}meaning'],
          )!,
      videosSigns: $CardsTableTable.$convertervideosSigns.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}videos_signs'],
        )!,
      ),
      sourceDictionnary: $CardsTableTable.$convertersourceDictionnary.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}source_dictionnary'],
        )!,
      ),
      dictionnarySignId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}dictionnary_sign_id'],
          )!,
      tags: $CardsTableTable.$convertertags.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tags'],
        )!,
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $CardsTableTable createAlias(String alias) {
    return $CardsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<List<String>, String, Object?>
  $convertervideosSigns = ListString.converter;
  static JsonTypeConverter2<LsfDictionaryName, int, int>
  $convertersourceDictionnary = const EnumIndexConverter<LsfDictionaryName>(
    LsfDictionaryName.values,
  );
  static JsonTypeConverter2<List<String>, String, Object?> $convertertags =
      ListString.converter;
}

class CardsTableData extends DataClass implements Insertable<CardsTableData> {
  final int id;
  final int deckId;
  final String name;
  final String typology;
  final String meaning;
  final List<String> videosSigns;
  final LsfDictionaryName sourceDictionnary;
  final int dictionnarySignId;
  final List<String> tags;
  final DateTime createdAt;
  const CardsTableData({
    required this.id,
    required this.deckId,
    required this.name,
    required this.typology,
    required this.meaning,
    required this.videosSigns,
    required this.sourceDictionnary,
    required this.dictionnarySignId,
    required this.tags,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['deck_id'] = Variable<int>(deckId);
    map['name'] = Variable<String>(name);
    map['typology'] = Variable<String>(typology);
    map['meaning'] = Variable<String>(meaning);
    {
      map['videos_signs'] = Variable<String>(
        $CardsTableTable.$convertervideosSigns.toSql(videosSigns),
      );
    }
    {
      map['source_dictionnary'] = Variable<int>(
        $CardsTableTable.$convertersourceDictionnary.toSql(sourceDictionnary),
      );
    }
    map['dictionnary_sign_id'] = Variable<int>(dictionnarySignId);
    {
      map['tags'] = Variable<String>(
        $CardsTableTable.$convertertags.toSql(tags),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CardsTableCompanion toCompanion(bool nullToAbsent) {
    return CardsTableCompanion(
      id: Value(id),
      deckId: Value(deckId),
      name: Value(name),
      typology: Value(typology),
      meaning: Value(meaning),
      videosSigns: Value(videosSigns),
      sourceDictionnary: Value(sourceDictionnary),
      dictionnarySignId: Value(dictionnarySignId),
      tags: Value(tags),
      createdAt: Value(createdAt),
    );
  }

  factory CardsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardsTableData(
      id: serializer.fromJson<int>(json['id']),
      deckId: serializer.fromJson<int>(json['deckId']),
      name: serializer.fromJson<String>(json['name']),
      typology: serializer.fromJson<String>(json['typology']),
      meaning: serializer.fromJson<String>(json['meaning']),
      videosSigns: $CardsTableTable.$convertervideosSigns.fromJson(
        serializer.fromJson<Object?>(json['videosSigns']),
      ),
      sourceDictionnary: $CardsTableTable.$convertersourceDictionnary.fromJson(
        serializer.fromJson<int>(json['sourceDictionnary']),
      ),
      dictionnarySignId: serializer.fromJson<int>(json['dictionnarySignId']),
      tags: $CardsTableTable.$convertertags.fromJson(
        serializer.fromJson<Object?>(json['tags']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deckId': serializer.toJson<int>(deckId),
      'name': serializer.toJson<String>(name),
      'typology': serializer.toJson<String>(typology),
      'meaning': serializer.toJson<String>(meaning),
      'videosSigns': serializer.toJson<Object?>(
        $CardsTableTable.$convertervideosSigns.toJson(videosSigns),
      ),
      'sourceDictionnary': serializer.toJson<int>(
        $CardsTableTable.$convertersourceDictionnary.toJson(sourceDictionnary),
      ),
      'dictionnarySignId': serializer.toJson<int>(dictionnarySignId),
      'tags': serializer.toJson<Object?>(
        $CardsTableTable.$convertertags.toJson(tags),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CardsTableData copyWith({
    int? id,
    int? deckId,
    String? name,
    String? typology,
    String? meaning,
    List<String>? videosSigns,
    LsfDictionaryName? sourceDictionnary,
    int? dictionnarySignId,
    List<String>? tags,
    DateTime? createdAt,
  }) => CardsTableData(
    id: id ?? this.id,
    deckId: deckId ?? this.deckId,
    name: name ?? this.name,
    typology: typology ?? this.typology,
    meaning: meaning ?? this.meaning,
    videosSigns: videosSigns ?? this.videosSigns,
    sourceDictionnary: sourceDictionnary ?? this.sourceDictionnary,
    dictionnarySignId: dictionnarySignId ?? this.dictionnarySignId,
    tags: tags ?? this.tags,
    createdAt: createdAt ?? this.createdAt,
  );
  CardsTableData copyWithCompanion(CardsTableCompanion data) {
    return CardsTableData(
      id: data.id.present ? data.id.value : this.id,
      deckId: data.deckId.present ? data.deckId.value : this.deckId,
      name: data.name.present ? data.name.value : this.name,
      typology: data.typology.present ? data.typology.value : this.typology,
      meaning: data.meaning.present ? data.meaning.value : this.meaning,
      videosSigns:
          data.videosSigns.present ? data.videosSigns.value : this.videosSigns,
      sourceDictionnary:
          data.sourceDictionnary.present
              ? data.sourceDictionnary.value
              : this.sourceDictionnary,
      dictionnarySignId:
          data.dictionnarySignId.present
              ? data.dictionnarySignId.value
              : this.dictionnarySignId,
      tags: data.tags.present ? data.tags.value : this.tags,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardsTableData(')
          ..write('id: $id, ')
          ..write('deckId: $deckId, ')
          ..write('name: $name, ')
          ..write('typology: $typology, ')
          ..write('meaning: $meaning, ')
          ..write('videosSigns: $videosSigns, ')
          ..write('sourceDictionnary: $sourceDictionnary, ')
          ..write('dictionnarySignId: $dictionnarySignId, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    deckId,
    name,
    typology,
    meaning,
    videosSigns,
    sourceDictionnary,
    dictionnarySignId,
    tags,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardsTableData &&
          other.id == this.id &&
          other.deckId == this.deckId &&
          other.name == this.name &&
          other.typology == this.typology &&
          other.meaning == this.meaning &&
          other.videosSigns == this.videosSigns &&
          other.sourceDictionnary == this.sourceDictionnary &&
          other.dictionnarySignId == this.dictionnarySignId &&
          other.tags == this.tags &&
          other.createdAt == this.createdAt);
}

class CardsTableCompanion extends UpdateCompanion<CardsTableData> {
  final Value<int> id;
  final Value<int> deckId;
  final Value<String> name;
  final Value<String> typology;
  final Value<String> meaning;
  final Value<List<String>> videosSigns;
  final Value<LsfDictionaryName> sourceDictionnary;
  final Value<int> dictionnarySignId;
  final Value<List<String>> tags;
  final Value<DateTime> createdAt;
  const CardsTableCompanion({
    this.id = const Value.absent(),
    this.deckId = const Value.absent(),
    this.name = const Value.absent(),
    this.typology = const Value.absent(),
    this.meaning = const Value.absent(),
    this.videosSigns = const Value.absent(),
    this.sourceDictionnary = const Value.absent(),
    this.dictionnarySignId = const Value.absent(),
    this.tags = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CardsTableCompanion.insert({
    this.id = const Value.absent(),
    required int deckId,
    required String name,
    required String typology,
    required String meaning,
    required List<String> videosSigns,
    required LsfDictionaryName sourceDictionnary,
    required int dictionnarySignId,
    this.tags = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : deckId = Value(deckId),
       name = Value(name),
       typology = Value(typology),
       meaning = Value(meaning),
       videosSigns = Value(videosSigns),
       sourceDictionnary = Value(sourceDictionnary),
       dictionnarySignId = Value(dictionnarySignId);
  static Insertable<CardsTableData> custom({
    Expression<int>? id,
    Expression<int>? deckId,
    Expression<String>? name,
    Expression<String>? typology,
    Expression<String>? meaning,
    Expression<String>? videosSigns,
    Expression<int>? sourceDictionnary,
    Expression<int>? dictionnarySignId,
    Expression<String>? tags,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deckId != null) 'deck_id': deckId,
      if (name != null) 'name': name,
      if (typology != null) 'typology': typology,
      if (meaning != null) 'meaning': meaning,
      if (videosSigns != null) 'videos_signs': videosSigns,
      if (sourceDictionnary != null) 'source_dictionnary': sourceDictionnary,
      if (dictionnarySignId != null) 'dictionnary_sign_id': dictionnarySignId,
      if (tags != null) 'tags': tags,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CardsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? deckId,
    Value<String>? name,
    Value<String>? typology,
    Value<String>? meaning,
    Value<List<String>>? videosSigns,
    Value<LsfDictionaryName>? sourceDictionnary,
    Value<int>? dictionnarySignId,
    Value<List<String>>? tags,
    Value<DateTime>? createdAt,
  }) {
    return CardsTableCompanion(
      id: id ?? this.id,
      deckId: deckId ?? this.deckId,
      name: name ?? this.name,
      typology: typology ?? this.typology,
      meaning: meaning ?? this.meaning,
      videosSigns: videosSigns ?? this.videosSigns,
      sourceDictionnary: sourceDictionnary ?? this.sourceDictionnary,
      dictionnarySignId: dictionnarySignId ?? this.dictionnarySignId,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deckId.present) {
      map['deck_id'] = Variable<int>(deckId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (typology.present) {
      map['typology'] = Variable<String>(typology.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (videosSigns.present) {
      map['videos_signs'] = Variable<String>(
        $CardsTableTable.$convertervideosSigns.toSql(videosSigns.value),
      );
    }
    if (sourceDictionnary.present) {
      map['source_dictionnary'] = Variable<int>(
        $CardsTableTable.$convertersourceDictionnary.toSql(
          sourceDictionnary.value,
        ),
      );
    }
    if (dictionnarySignId.present) {
      map['dictionnary_sign_id'] = Variable<int>(dictionnarySignId.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(
        $CardsTableTable.$convertertags.toSql(tags.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardsTableCompanion(')
          ..write('id: $id, ')
          ..write('deckId: $deckId, ')
          ..write('name: $name, ')
          ..write('typology: $typology, ')
          ..write('meaning: $meaning, ')
          ..write('videosSigns: $videosSigns, ')
          ..write('sourceDictionnary: $sourceDictionnary, ')
          ..write('dictionnarySignId: $dictionnarySignId, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDriftDatabase extends GeneratedDatabase {
  _$AppDriftDatabase(QueryExecutor e) : super(e);
  $AppDriftDatabaseManager get managers => $AppDriftDatabaseManager(this);
  late final $DecksTableTable decksTable = $DecksTableTable(this);
  late final $CardsTableTable cardsTable = $CardsTableTable(this);
  late final Index deckId = Index(
    'deck_id',
    'CREATE INDEX deck_id ON cards_table (deck_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    decksTable,
    cardsTable,
    deckId,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'decks_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('cards_table', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$DecksTableTableCreateCompanionBuilder =
    DecksTableCompanion Function({
      Value<int> id,
      required String name,
      required String description,
      Value<DateTime> createdAt,
    });
typedef $$DecksTableTableUpdateCompanionBuilder =
    DecksTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<DateTime> createdAt,
    });

final class $$DecksTableTableReferences
    extends
        BaseReferences<_$AppDriftDatabase, $DecksTableTable, DecksTableData> {
  $$DecksTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CardsTableTable, List<CardsTableData>>
  _cardsTableRefsTable(_$AppDriftDatabase db) => MultiTypedResultKey.fromTable(
    db.cardsTable,
    aliasName: $_aliasNameGenerator(db.decksTable.id, db.cardsTable.deckId),
  );

  $$CardsTableTableProcessedTableManager get cardsTableRefs {
    final manager = $$CardsTableTableTableManager(
      $_db,
      $_db.cardsTable,
    ).filter((f) => f.deckId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_cardsTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DecksTableTableFilterComposer
    extends Composer<_$AppDriftDatabase, $DecksTableTable> {
  $$DecksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> cardsTableRefs(
    Expression<bool> Function($$CardsTableTableFilterComposer f) f,
  ) {
    final $$CardsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cardsTable,
      getReferencedColumn: (t) => t.deckId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardsTableTableFilterComposer(
            $db: $db,
            $table: $db.cardsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DecksTableTableOrderingComposer
    extends Composer<_$AppDriftDatabase, $DecksTableTable> {
  $$DecksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DecksTableTableAnnotationComposer
    extends Composer<_$AppDriftDatabase, $DecksTableTable> {
  $$DecksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> cardsTableRefs<T extends Object>(
    Expression<T> Function($$CardsTableTableAnnotationComposer a) f,
  ) {
    final $$CardsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cardsTable,
      getReferencedColumn: (t) => t.deckId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.cardsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DecksTableTableTableManager
    extends
        RootTableManager<
          _$AppDriftDatabase,
          $DecksTableTable,
          DecksTableData,
          $$DecksTableTableFilterComposer,
          $$DecksTableTableOrderingComposer,
          $$DecksTableTableAnnotationComposer,
          $$DecksTableTableCreateCompanionBuilder,
          $$DecksTableTableUpdateCompanionBuilder,
          (DecksTableData, $$DecksTableTableReferences),
          DecksTableData,
          PrefetchHooks Function({bool cardsTableRefs})
        > {
  $$DecksTableTableTableManager(_$AppDriftDatabase db, $DecksTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DecksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DecksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DecksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DecksTableCompanion(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String description,
                Value<DateTime> createdAt = const Value.absent(),
              }) => DecksTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$DecksTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({cardsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (cardsTableRefs) db.cardsTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cardsTableRefs)
                    await $_getPrefetchedData<
                      DecksTableData,
                      $DecksTableTable,
                      CardsTableData
                    >(
                      currentTable: table,
                      referencedTable: $$DecksTableTableReferences
                          ._cardsTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$DecksTableTableReferences(
                                db,
                                table,
                                p0,
                              ).cardsTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.deckId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DecksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDriftDatabase,
      $DecksTableTable,
      DecksTableData,
      $$DecksTableTableFilterComposer,
      $$DecksTableTableOrderingComposer,
      $$DecksTableTableAnnotationComposer,
      $$DecksTableTableCreateCompanionBuilder,
      $$DecksTableTableUpdateCompanionBuilder,
      (DecksTableData, $$DecksTableTableReferences),
      DecksTableData,
      PrefetchHooks Function({bool cardsTableRefs})
    >;
typedef $$CardsTableTableCreateCompanionBuilder =
    CardsTableCompanion Function({
      Value<int> id,
      required int deckId,
      required String name,
      required String typology,
      required String meaning,
      required List<String> videosSigns,
      required LsfDictionaryName sourceDictionnary,
      required int dictionnarySignId,
      Value<List<String>> tags,
      Value<DateTime> createdAt,
    });
typedef $$CardsTableTableUpdateCompanionBuilder =
    CardsTableCompanion Function({
      Value<int> id,
      Value<int> deckId,
      Value<String> name,
      Value<String> typology,
      Value<String> meaning,
      Value<List<String>> videosSigns,
      Value<LsfDictionaryName> sourceDictionnary,
      Value<int> dictionnarySignId,
      Value<List<String>> tags,
      Value<DateTime> createdAt,
    });

final class $$CardsTableTableReferences
    extends
        BaseReferences<_$AppDriftDatabase, $CardsTableTable, CardsTableData> {
  $$CardsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DecksTableTable _deckIdTable(_$AppDriftDatabase db) =>
      db.decksTable.createAlias(
        $_aliasNameGenerator(db.cardsTable.deckId, db.decksTable.id),
      );

  $$DecksTableTableProcessedTableManager get deckId {
    final $_column = $_itemColumn<int>('deck_id')!;

    final manager = $$DecksTableTableTableManager(
      $_db,
      $_db.decksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_deckIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CardsTableTableFilterComposer
    extends Composer<_$AppDriftDatabase, $CardsTableTable> {
  $$CardsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get typology => $composableBuilder(
    column: $table.typology,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meaning => $composableBuilder(
    column: $table.meaning,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get videosSigns => $composableBuilder(
    column: $table.videosSigns,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<LsfDictionaryName, LsfDictionaryName, int>
  get sourceDictionnary => $composableBuilder(
    column: $table.sourceDictionnary,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get dictionnarySignId => $composableBuilder(
    column: $table.dictionnarySignId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
        column: $table.tags,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DecksTableTableFilterComposer get deckId {
    final $$DecksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.deckId,
      referencedTable: $db.decksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecksTableTableFilterComposer(
            $db: $db,
            $table: $db.decksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CardsTableTableOrderingComposer
    extends Composer<_$AppDriftDatabase, $CardsTableTable> {
  $$CardsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get typology => $composableBuilder(
    column: $table.typology,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meaning => $composableBuilder(
    column: $table.meaning,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get videosSigns => $composableBuilder(
    column: $table.videosSigns,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sourceDictionnary => $composableBuilder(
    column: $table.sourceDictionnary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dictionnarySignId => $composableBuilder(
    column: $table.dictionnarySignId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DecksTableTableOrderingComposer get deckId {
    final $$DecksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.deckId,
      referencedTable: $db.decksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecksTableTableOrderingComposer(
            $db: $db,
            $table: $db.decksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CardsTableTableAnnotationComposer
    extends Composer<_$AppDriftDatabase, $CardsTableTable> {
  $$CardsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get typology =>
      $composableBuilder(column: $table.typology, builder: (column) => column);

  GeneratedColumn<String> get meaning =>
      $composableBuilder(column: $table.meaning, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get videosSigns =>
      $composableBuilder(
        column: $table.videosSigns,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<LsfDictionaryName, int>
  get sourceDictionnary => $composableBuilder(
    column: $table.sourceDictionnary,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dictionnarySignId => $composableBuilder(
    column: $table.dictionnarySignId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$DecksTableTableAnnotationComposer get deckId {
    final $$DecksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.deckId,
      referencedTable: $db.decksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.decksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CardsTableTableTableManager
    extends
        RootTableManager<
          _$AppDriftDatabase,
          $CardsTableTable,
          CardsTableData,
          $$CardsTableTableFilterComposer,
          $$CardsTableTableOrderingComposer,
          $$CardsTableTableAnnotationComposer,
          $$CardsTableTableCreateCompanionBuilder,
          $$CardsTableTableUpdateCompanionBuilder,
          (CardsTableData, $$CardsTableTableReferences),
          CardsTableData,
          PrefetchHooks Function({bool deckId})
        > {
  $$CardsTableTableTableManager(_$AppDriftDatabase db, $CardsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CardsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CardsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CardsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> deckId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> typology = const Value.absent(),
                Value<String> meaning = const Value.absent(),
                Value<List<String>> videosSigns = const Value.absent(),
                Value<LsfDictionaryName> sourceDictionnary =
                    const Value.absent(),
                Value<int> dictionnarySignId = const Value.absent(),
                Value<List<String>> tags = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CardsTableCompanion(
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
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int deckId,
                required String name,
                required String typology,
                required String meaning,
                required List<String> videosSigns,
                required LsfDictionaryName sourceDictionnary,
                required int dictionnarySignId,
                Value<List<String>> tags = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CardsTableCompanion.insert(
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
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CardsTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({deckId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (deckId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.deckId,
                            referencedTable: $$CardsTableTableReferences
                                ._deckIdTable(db),
                            referencedColumn:
                                $$CardsTableTableReferences._deckIdTable(db).id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CardsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDriftDatabase,
      $CardsTableTable,
      CardsTableData,
      $$CardsTableTableFilterComposer,
      $$CardsTableTableOrderingComposer,
      $$CardsTableTableAnnotationComposer,
      $$CardsTableTableCreateCompanionBuilder,
      $$CardsTableTableUpdateCompanionBuilder,
      (CardsTableData, $$CardsTableTableReferences),
      CardsTableData,
      PrefetchHooks Function({bool deckId})
    >;

class $AppDriftDatabaseManager {
  final _$AppDriftDatabase _db;
  $AppDriftDatabaseManager(this._db);
  $$DecksTableTableTableManager get decksTable =>
      $$DecksTableTableTableManager(_db, _db.decksTable);
  $$CardsTableTableTableManager get cardsTable =>
      $$CardsTableTableTableManager(_db, _db.cardsTable);
}
