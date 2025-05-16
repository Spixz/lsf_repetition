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
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> tags =
      GeneratedColumn<String>(
        'tags',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        clientDefault: () => "[]",
      ).withConverter<List<String>?>($CardsTableTable.$convertertagsn);
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
      deckId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deck_id'],
      ),
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
      dictionnarySignId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dictionnary_sign_id'],
      ),
      tags: $CardsTableTable.$convertertagsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tags'],
        ),
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
  static JsonTypeConverter2<List<String>?, String?, Object?> $convertertagsn =
      JsonTypeConverter2.asNullable($convertertags);
}

class CardsTableData extends DataClass implements Insertable<CardsTableData> {
  final int id;
  final int? deckId;
  final String name;
  final String typology;
  final String meaning;
  final List<String> videosSigns;
  final LsfDictionaryName sourceDictionnary;
  final int? dictionnarySignId;
  final List<String>? tags;
  final DateTime createdAt;
  const CardsTableData({
    required this.id,
    this.deckId,
    required this.name,
    required this.typology,
    required this.meaning,
    required this.videosSigns,
    required this.sourceDictionnary,
    this.dictionnarySignId,
    this.tags,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || deckId != null) {
      map['deck_id'] = Variable<int>(deckId);
    }
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
    if (!nullToAbsent || dictionnarySignId != null) {
      map['dictionnary_sign_id'] = Variable<int>(dictionnarySignId);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(
        $CardsTableTable.$convertertagsn.toSql(tags),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CardsTableCompanion toCompanion(bool nullToAbsent) {
    return CardsTableCompanion(
      id: Value(id),
      deckId:
          deckId == null && nullToAbsent ? const Value.absent() : Value(deckId),
      name: Value(name),
      typology: Value(typology),
      meaning: Value(meaning),
      videosSigns: Value(videosSigns),
      sourceDictionnary: Value(sourceDictionnary),
      dictionnarySignId:
          dictionnarySignId == null && nullToAbsent
              ? const Value.absent()
              : Value(dictionnarySignId),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
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
      deckId: serializer.fromJson<int?>(json['deckId']),
      name: serializer.fromJson<String>(json['name']),
      typology: serializer.fromJson<String>(json['typology']),
      meaning: serializer.fromJson<String>(json['meaning']),
      videosSigns: $CardsTableTable.$convertervideosSigns.fromJson(
        serializer.fromJson<Object?>(json['videosSigns']),
      ),
      sourceDictionnary: $CardsTableTable.$convertersourceDictionnary.fromJson(
        serializer.fromJson<int>(json['sourceDictionnary']),
      ),
      dictionnarySignId: serializer.fromJson<int?>(json['dictionnarySignId']),
      tags: $CardsTableTable.$convertertagsn.fromJson(
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
      'deckId': serializer.toJson<int?>(deckId),
      'name': serializer.toJson<String>(name),
      'typology': serializer.toJson<String>(typology),
      'meaning': serializer.toJson<String>(meaning),
      'videosSigns': serializer.toJson<Object?>(
        $CardsTableTable.$convertervideosSigns.toJson(videosSigns),
      ),
      'sourceDictionnary': serializer.toJson<int>(
        $CardsTableTable.$convertersourceDictionnary.toJson(sourceDictionnary),
      ),
      'dictionnarySignId': serializer.toJson<int?>(dictionnarySignId),
      'tags': serializer.toJson<Object?>(
        $CardsTableTable.$convertertagsn.toJson(tags),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CardsTableData copyWith({
    int? id,
    Value<int?> deckId = const Value.absent(),
    String? name,
    String? typology,
    String? meaning,
    List<String>? videosSigns,
    LsfDictionaryName? sourceDictionnary,
    Value<int?> dictionnarySignId = const Value.absent(),
    Value<List<String>?> tags = const Value.absent(),
    DateTime? createdAt,
  }) => CardsTableData(
    id: id ?? this.id,
    deckId: deckId.present ? deckId.value : this.deckId,
    name: name ?? this.name,
    typology: typology ?? this.typology,
    meaning: meaning ?? this.meaning,
    videosSigns: videosSigns ?? this.videosSigns,
    sourceDictionnary: sourceDictionnary ?? this.sourceDictionnary,
    dictionnarySignId:
        dictionnarySignId.present
            ? dictionnarySignId.value
            : this.dictionnarySignId,
    tags: tags.present ? tags.value : this.tags,
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
  final Value<int?> deckId;
  final Value<String> name;
  final Value<String> typology;
  final Value<String> meaning;
  final Value<List<String>> videosSigns;
  final Value<LsfDictionaryName> sourceDictionnary;
  final Value<int?> dictionnarySignId;
  final Value<List<String>?> tags;
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
    this.deckId = const Value.absent(),
    required String name,
    required String typology,
    required String meaning,
    required List<String> videosSigns,
    required LsfDictionaryName sourceDictionnary,
    this.dictionnarySignId = const Value.absent(),
    this.tags = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       typology = Value(typology),
       meaning = Value(meaning),
       videosSigns = Value(videosSigns),
       sourceDictionnary = Value(sourceDictionnary);
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
    Value<int?>? deckId,
    Value<String>? name,
    Value<String>? typology,
    Value<String>? meaning,
    Value<List<String>>? videosSigns,
    Value<LsfDictionaryName>? sourceDictionnary,
    Value<int?>? dictionnarySignId,
    Value<List<String>?>? tags,
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
        $CardsTableTable.$convertertagsn.toSql(tags.value),
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

class $RetentionTableTable extends RetentionTable
    with TableInfo<$RetentionTableTable, RetentionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RetentionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<int> cardId = GeneratedColumn<int>(
    'card_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cards_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dueMeta = const VerificationMeta('due');
  @override
  late final GeneratedColumn<DateTime> due = GeneratedColumn<DateTime>(
    'due',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastReviewMeta = const VerificationMeta(
    'lastReview',
  );
  @override
  late final GeneratedColumn<DateTime> lastReview = GeneratedColumn<DateTime>(
    'last_review',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stabilityMeta = const VerificationMeta(
    'stability',
  );
  @override
  late final GeneratedColumn<double> stability = GeneratedColumn<double>(
    'stability',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    clientDefault: () => 0.0,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<double> difficulty = GeneratedColumn<double>(
    'difficulty',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    clientDefault: () => 0.0,
  );
  static const VerificationMeta _elapsedDaysMeta = const VerificationMeta(
    'elapsedDays',
  );
  @override
  late final GeneratedColumn<int> elapsedDays = GeneratedColumn<int>(
    'elapsed_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  static const VerificationMeta _scheduledDaysMeta = const VerificationMeta(
    'scheduledDays',
  );
  @override
  late final GeneratedColumn<int> scheduledDays = GeneratedColumn<int>(
    'scheduled_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  static const VerificationMeta _lapsesMeta = const VerificationMeta('lapses');
  @override
  late final GeneratedColumn<int> lapses = GeneratedColumn<int>(
    'lapses',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  @override
  late final GeneratedColumnWithTypeConverter<RetentionState, int> state =
      GeneratedColumn<int>(
        'state',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        clientDefault: () => RetentionState.newState.index,
      ).withConverter<RetentionState>($RetentionTableTable.$converterstate);
  @override
  List<GeneratedColumn> get $columns => [
    cardId,
    due,
    lastReview,
    stability,
    difficulty,
    elapsedDays,
    scheduledDays,
    reps,
    lapses,
    state,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'retention_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RetentionTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('card_id')) {
      context.handle(
        _cardIdMeta,
        cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('due')) {
      context.handle(
        _dueMeta,
        due.isAcceptableOrUnknown(data['due']!, _dueMeta),
      );
    } else if (isInserting) {
      context.missing(_dueMeta);
    }
    if (data.containsKey('last_review')) {
      context.handle(
        _lastReviewMeta,
        lastReview.isAcceptableOrUnknown(data['last_review']!, _lastReviewMeta),
      );
    } else if (isInserting) {
      context.missing(_lastReviewMeta);
    }
    if (data.containsKey('stability')) {
      context.handle(
        _stabilityMeta,
        stability.isAcceptableOrUnknown(data['stability']!, _stabilityMeta),
      );
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    if (data.containsKey('elapsed_days')) {
      context.handle(
        _elapsedDaysMeta,
        elapsedDays.isAcceptableOrUnknown(
          data['elapsed_days']!,
          _elapsedDaysMeta,
        ),
      );
    }
    if (data.containsKey('scheduled_days')) {
      context.handle(
        _scheduledDaysMeta,
        scheduledDays.isAcceptableOrUnknown(
          data['scheduled_days']!,
          _scheduledDaysMeta,
        ),
      );
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    }
    if (data.containsKey('lapses')) {
      context.handle(
        _lapsesMeta,
        lapses.isAcceptableOrUnknown(data['lapses']!, _lapsesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  RetentionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RetentionTableData(
      cardId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}card_id'],
          )!,
      due:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}due'],
          )!,
      lastReview:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}last_review'],
          )!,
      stability:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}stability'],
          )!,
      difficulty:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}difficulty'],
          )!,
      elapsedDays:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}elapsed_days'],
          )!,
      scheduledDays:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}scheduled_days'],
          )!,
      reps:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}reps'],
          )!,
      lapses:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}lapses'],
          )!,
      state: $RetentionTableTable.$converterstate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}state'],
        )!,
      ),
    );
  }

  @override
  $RetentionTableTable createAlias(String alias) {
    return $RetentionTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<RetentionState, int, int> $converterstate =
      const EnumIndexConverter<RetentionState>(RetentionState.values);
}

class RetentionTableData extends DataClass
    implements Insertable<RetentionTableData> {
  final int cardId;
  final DateTime due;
  final DateTime lastReview;
  final double stability;
  final double difficulty;
  final int elapsedDays;
  final int scheduledDays;
  final int reps;
  final int lapses;
  final RetentionState state;
  const RetentionTableData({
    required this.cardId,
    required this.due,
    required this.lastReview,
    required this.stability,
    required this.difficulty,
    required this.elapsedDays,
    required this.scheduledDays,
    required this.reps,
    required this.lapses,
    required this.state,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['card_id'] = Variable<int>(cardId);
    map['due'] = Variable<DateTime>(due);
    map['last_review'] = Variable<DateTime>(lastReview);
    map['stability'] = Variable<double>(stability);
    map['difficulty'] = Variable<double>(difficulty);
    map['elapsed_days'] = Variable<int>(elapsedDays);
    map['scheduled_days'] = Variable<int>(scheduledDays);
    map['reps'] = Variable<int>(reps);
    map['lapses'] = Variable<int>(lapses);
    {
      map['state'] = Variable<int>(
        $RetentionTableTable.$converterstate.toSql(state),
      );
    }
    return map;
  }

  RetentionTableCompanion toCompanion(bool nullToAbsent) {
    return RetentionTableCompanion(
      cardId: Value(cardId),
      due: Value(due),
      lastReview: Value(lastReview),
      stability: Value(stability),
      difficulty: Value(difficulty),
      elapsedDays: Value(elapsedDays),
      scheduledDays: Value(scheduledDays),
      reps: Value(reps),
      lapses: Value(lapses),
      state: Value(state),
    );
  }

  factory RetentionTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RetentionTableData(
      cardId: serializer.fromJson<int>(json['cardId']),
      due: serializer.fromJson<DateTime>(json['due']),
      lastReview: serializer.fromJson<DateTime>(json['lastReview']),
      stability: serializer.fromJson<double>(json['stability']),
      difficulty: serializer.fromJson<double>(json['difficulty']),
      elapsedDays: serializer.fromJson<int>(json['elapsedDays']),
      scheduledDays: serializer.fromJson<int>(json['scheduledDays']),
      reps: serializer.fromJson<int>(json['reps']),
      lapses: serializer.fromJson<int>(json['lapses']),
      state: $RetentionTableTable.$converterstate.fromJson(
        serializer.fromJson<int>(json['state']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cardId': serializer.toJson<int>(cardId),
      'due': serializer.toJson<DateTime>(due),
      'lastReview': serializer.toJson<DateTime>(lastReview),
      'stability': serializer.toJson<double>(stability),
      'difficulty': serializer.toJson<double>(difficulty),
      'elapsedDays': serializer.toJson<int>(elapsedDays),
      'scheduledDays': serializer.toJson<int>(scheduledDays),
      'reps': serializer.toJson<int>(reps),
      'lapses': serializer.toJson<int>(lapses),
      'state': serializer.toJson<int>(
        $RetentionTableTable.$converterstate.toJson(state),
      ),
    };
  }

  RetentionTableData copyWith({
    int? cardId,
    DateTime? due,
    DateTime? lastReview,
    double? stability,
    double? difficulty,
    int? elapsedDays,
    int? scheduledDays,
    int? reps,
    int? lapses,
    RetentionState? state,
  }) => RetentionTableData(
    cardId: cardId ?? this.cardId,
    due: due ?? this.due,
    lastReview: lastReview ?? this.lastReview,
    stability: stability ?? this.stability,
    difficulty: difficulty ?? this.difficulty,
    elapsedDays: elapsedDays ?? this.elapsedDays,
    scheduledDays: scheduledDays ?? this.scheduledDays,
    reps: reps ?? this.reps,
    lapses: lapses ?? this.lapses,
    state: state ?? this.state,
  );
  RetentionTableData copyWithCompanion(RetentionTableCompanion data) {
    return RetentionTableData(
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      due: data.due.present ? data.due.value : this.due,
      lastReview:
          data.lastReview.present ? data.lastReview.value : this.lastReview,
      stability: data.stability.present ? data.stability.value : this.stability,
      difficulty:
          data.difficulty.present ? data.difficulty.value : this.difficulty,
      elapsedDays:
          data.elapsedDays.present ? data.elapsedDays.value : this.elapsedDays,
      scheduledDays:
          data.scheduledDays.present
              ? data.scheduledDays.value
              : this.scheduledDays,
      reps: data.reps.present ? data.reps.value : this.reps,
      lapses: data.lapses.present ? data.lapses.value : this.lapses,
      state: data.state.present ? data.state.value : this.state,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RetentionTableData(')
          ..write('cardId: $cardId, ')
          ..write('due: $due, ')
          ..write('lastReview: $lastReview, ')
          ..write('stability: $stability, ')
          ..write('difficulty: $difficulty, ')
          ..write('elapsedDays: $elapsedDays, ')
          ..write('scheduledDays: $scheduledDays, ')
          ..write('reps: $reps, ')
          ..write('lapses: $lapses, ')
          ..write('state: $state')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    cardId,
    due,
    lastReview,
    stability,
    difficulty,
    elapsedDays,
    scheduledDays,
    reps,
    lapses,
    state,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RetentionTableData &&
          other.cardId == this.cardId &&
          other.due == this.due &&
          other.lastReview == this.lastReview &&
          other.stability == this.stability &&
          other.difficulty == this.difficulty &&
          other.elapsedDays == this.elapsedDays &&
          other.scheduledDays == this.scheduledDays &&
          other.reps == this.reps &&
          other.lapses == this.lapses &&
          other.state == this.state);
}

class RetentionTableCompanion extends UpdateCompanion<RetentionTableData> {
  final Value<int> cardId;
  final Value<DateTime> due;
  final Value<DateTime> lastReview;
  final Value<double> stability;
  final Value<double> difficulty;
  final Value<int> elapsedDays;
  final Value<int> scheduledDays;
  final Value<int> reps;
  final Value<int> lapses;
  final Value<RetentionState> state;
  final Value<int> rowid;
  const RetentionTableCompanion({
    this.cardId = const Value.absent(),
    this.due = const Value.absent(),
    this.lastReview = const Value.absent(),
    this.stability = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.elapsedDays = const Value.absent(),
    this.scheduledDays = const Value.absent(),
    this.reps = const Value.absent(),
    this.lapses = const Value.absent(),
    this.state = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RetentionTableCompanion.insert({
    required int cardId,
    required DateTime due,
    required DateTime lastReview,
    this.stability = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.elapsedDays = const Value.absent(),
    this.scheduledDays = const Value.absent(),
    this.reps = const Value.absent(),
    this.lapses = const Value.absent(),
    this.state = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : cardId = Value(cardId),
       due = Value(due),
       lastReview = Value(lastReview);
  static Insertable<RetentionTableData> custom({
    Expression<int>? cardId,
    Expression<DateTime>? due,
    Expression<DateTime>? lastReview,
    Expression<double>? stability,
    Expression<double>? difficulty,
    Expression<int>? elapsedDays,
    Expression<int>? scheduledDays,
    Expression<int>? reps,
    Expression<int>? lapses,
    Expression<int>? state,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cardId != null) 'card_id': cardId,
      if (due != null) 'due': due,
      if (lastReview != null) 'last_review': lastReview,
      if (stability != null) 'stability': stability,
      if (difficulty != null) 'difficulty': difficulty,
      if (elapsedDays != null) 'elapsed_days': elapsedDays,
      if (scheduledDays != null) 'scheduled_days': scheduledDays,
      if (reps != null) 'reps': reps,
      if (lapses != null) 'lapses': lapses,
      if (state != null) 'state': state,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RetentionTableCompanion copyWith({
    Value<int>? cardId,
    Value<DateTime>? due,
    Value<DateTime>? lastReview,
    Value<double>? stability,
    Value<double>? difficulty,
    Value<int>? elapsedDays,
    Value<int>? scheduledDays,
    Value<int>? reps,
    Value<int>? lapses,
    Value<RetentionState>? state,
    Value<int>? rowid,
  }) {
    return RetentionTableCompanion(
      cardId: cardId ?? this.cardId,
      due: due ?? this.due,
      lastReview: lastReview ?? this.lastReview,
      stability: stability ?? this.stability,
      difficulty: difficulty ?? this.difficulty,
      elapsedDays: elapsedDays ?? this.elapsedDays,
      scheduledDays: scheduledDays ?? this.scheduledDays,
      reps: reps ?? this.reps,
      lapses: lapses ?? this.lapses,
      state: state ?? this.state,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cardId.present) {
      map['card_id'] = Variable<int>(cardId.value);
    }
    if (due.present) {
      map['due'] = Variable<DateTime>(due.value);
    }
    if (lastReview.present) {
      map['last_review'] = Variable<DateTime>(lastReview.value);
    }
    if (stability.present) {
      map['stability'] = Variable<double>(stability.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<double>(difficulty.value);
    }
    if (elapsedDays.present) {
      map['elapsed_days'] = Variable<int>(elapsedDays.value);
    }
    if (scheduledDays.present) {
      map['scheduled_days'] = Variable<int>(scheduledDays.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (lapses.present) {
      map['lapses'] = Variable<int>(lapses.value);
    }
    if (state.present) {
      map['state'] = Variable<int>(
        $RetentionTableTable.$converterstate.toSql(state.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RetentionTableCompanion(')
          ..write('cardId: $cardId, ')
          ..write('due: $due, ')
          ..write('lastReview: $lastReview, ')
          ..write('stability: $stability, ')
          ..write('difficulty: $difficulty, ')
          ..write('elapsedDays: $elapsedDays, ')
          ..write('scheduledDays: $scheduledDays, ')
          ..write('reps: $reps, ')
          ..write('lapses: $lapses, ')
          ..write('state: $state, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDriftDatabase extends GeneratedDatabase {
  _$AppDriftDatabase(QueryExecutor e) : super(e);
  $AppDriftDatabaseManager get managers => $AppDriftDatabaseManager(this);
  late final $DecksTableTable decksTable = $DecksTableTable(this);
  late final $CardsTableTable cardsTable = $CardsTableTable(this);
  late final $RetentionTableTable retentionTable = $RetentionTableTable(this);
  late final Index cardId = Index(
    'card_id',
    'CREATE INDEX card_id ON retention_table (card_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    decksTable,
    cardsTable,
    retentionTable,
    cardId,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cards_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('retention_table', kind: UpdateKind.delete)],
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
          (
            DecksTableData,
            BaseReferences<
              _$AppDriftDatabase,
              $DecksTableTable,
              DecksTableData
            >,
          ),
          DecksTableData,
          PrefetchHooks Function()
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
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
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
      (
        DecksTableData,
        BaseReferences<_$AppDriftDatabase, $DecksTableTable, DecksTableData>,
      ),
      DecksTableData,
      PrefetchHooks Function()
    >;
typedef $$CardsTableTableCreateCompanionBuilder =
    CardsTableCompanion Function({
      Value<int> id,
      Value<int?> deckId,
      required String name,
      required String typology,
      required String meaning,
      required List<String> videosSigns,
      required LsfDictionaryName sourceDictionnary,
      Value<int?> dictionnarySignId,
      Value<List<String>?> tags,
      Value<DateTime> createdAt,
    });
typedef $$CardsTableTableUpdateCompanionBuilder =
    CardsTableCompanion Function({
      Value<int> id,
      Value<int?> deckId,
      Value<String> name,
      Value<String> typology,
      Value<String> meaning,
      Value<List<String>> videosSigns,
      Value<LsfDictionaryName> sourceDictionnary,
      Value<int?> dictionnarySignId,
      Value<List<String>?> tags,
      Value<DateTime> createdAt,
    });

final class $$CardsTableTableReferences
    extends
        BaseReferences<_$AppDriftDatabase, $CardsTableTable, CardsTableData> {
  $$CardsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RetentionTableTable, List<RetentionTableData>>
  _retentionTableRefsTable(_$AppDriftDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.retentionTable,
        aliasName: $_aliasNameGenerator(
          db.cardsTable.id,
          db.retentionTable.cardId,
        ),
      );

  $$RetentionTableTableProcessedTableManager get retentionTableRefs {
    final manager = $$RetentionTableTableTableManager(
      $_db,
      $_db.retentionTable,
    ).filter((f) => f.cardId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_retentionTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
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

  ColumnFilters<int> get deckId => $composableBuilder(
    column: $table.deckId,
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

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> retentionTableRefs(
    Expression<bool> Function($$RetentionTableTableFilterComposer f) f,
  ) {
    final $$RetentionTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.retentionTable,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetentionTableTableFilterComposer(
            $db: $db,
            $table: $db.retentionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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

  ColumnOrderings<int> get deckId => $composableBuilder(
    column: $table.deckId,
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

  GeneratedColumn<int> get deckId =>
      $composableBuilder(column: $table.deckId, builder: (column) => column);

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

  GeneratedColumnWithTypeConverter<List<String>?, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> retentionTableRefs<T extends Object>(
    Expression<T> Function($$RetentionTableTableAnnotationComposer a) f,
  ) {
    final $$RetentionTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.retentionTable,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetentionTableTableAnnotationComposer(
            $db: $db,
            $table: $db.retentionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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
          PrefetchHooks Function({bool retentionTableRefs})
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
                Value<int?> deckId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> typology = const Value.absent(),
                Value<String> meaning = const Value.absent(),
                Value<List<String>> videosSigns = const Value.absent(),
                Value<LsfDictionaryName> sourceDictionnary =
                    const Value.absent(),
                Value<int?> dictionnarySignId = const Value.absent(),
                Value<List<String>?> tags = const Value.absent(),
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
                Value<int?> deckId = const Value.absent(),
                required String name,
                required String typology,
                required String meaning,
                required List<String> videosSigns,
                required LsfDictionaryName sourceDictionnary,
                Value<int?> dictionnarySignId = const Value.absent(),
                Value<List<String>?> tags = const Value.absent(),
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
          prefetchHooksCallback: ({retentionTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (retentionTableRefs) db.retentionTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (retentionTableRefs)
                    await $_getPrefetchedData<
                      CardsTableData,
                      $CardsTableTable,
                      RetentionTableData
                    >(
                      currentTable: table,
                      referencedTable: $$CardsTableTableReferences
                          ._retentionTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CardsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).retentionTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.cardId == item.id),
                      typedResults: items,
                    ),
                ];
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
      PrefetchHooks Function({bool retentionTableRefs})
    >;
typedef $$RetentionTableTableCreateCompanionBuilder =
    RetentionTableCompanion Function({
      required int cardId,
      required DateTime due,
      required DateTime lastReview,
      Value<double> stability,
      Value<double> difficulty,
      Value<int> elapsedDays,
      Value<int> scheduledDays,
      Value<int> reps,
      Value<int> lapses,
      Value<RetentionState> state,
      Value<int> rowid,
    });
typedef $$RetentionTableTableUpdateCompanionBuilder =
    RetentionTableCompanion Function({
      Value<int> cardId,
      Value<DateTime> due,
      Value<DateTime> lastReview,
      Value<double> stability,
      Value<double> difficulty,
      Value<int> elapsedDays,
      Value<int> scheduledDays,
      Value<int> reps,
      Value<int> lapses,
      Value<RetentionState> state,
      Value<int> rowid,
    });

final class $$RetentionTableTableReferences
    extends
        BaseReferences<
          _$AppDriftDatabase,
          $RetentionTableTable,
          RetentionTableData
        > {
  $$RetentionTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CardsTableTable _cardIdTable(_$AppDriftDatabase db) =>
      db.cardsTable.createAlias(
        $_aliasNameGenerator(db.retentionTable.cardId, db.cardsTable.id),
      );

  $$CardsTableTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<int>('card_id')!;

    final manager = $$CardsTableTableTableManager(
      $_db,
      $_db.cardsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RetentionTableTableFilterComposer
    extends Composer<_$AppDriftDatabase, $RetentionTableTable> {
  $$RetentionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get due => $composableBuilder(
    column: $table.due,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReview => $composableBuilder(
    column: $table.lastReview,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get stability => $composableBuilder(
    column: $table.stability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get elapsedDays => $composableBuilder(
    column: $table.elapsedDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get scheduledDays => $composableBuilder(
    column: $table.scheduledDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lapses => $composableBuilder(
    column: $table.lapses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<RetentionState, RetentionState, int>
  get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$CardsTableTableFilterComposer get cardId {
    final $$CardsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.cardsTable,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$RetentionTableTableOrderingComposer
    extends Composer<_$AppDriftDatabase, $RetentionTableTable> {
  $$RetentionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get due => $composableBuilder(
    column: $table.due,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReview => $composableBuilder(
    column: $table.lastReview,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get stability => $composableBuilder(
    column: $table.stability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get elapsedDays => $composableBuilder(
    column: $table.elapsedDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get scheduledDays => $composableBuilder(
    column: $table.scheduledDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lapses => $composableBuilder(
    column: $table.lapses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  $$CardsTableTableOrderingComposer get cardId {
    final $$CardsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.cardsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardsTableTableOrderingComposer(
            $db: $db,
            $table: $db.cardsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RetentionTableTableAnnotationComposer
    extends Composer<_$AppDriftDatabase, $RetentionTableTable> {
  $$RetentionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get due =>
      $composableBuilder(column: $table.due, builder: (column) => column);

  GeneratedColumn<DateTime> get lastReview => $composableBuilder(
    column: $table.lastReview,
    builder: (column) => column,
  );

  GeneratedColumn<double> get stability =>
      $composableBuilder(column: $table.stability, builder: (column) => column);

  GeneratedColumn<double> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<int> get elapsedDays => $composableBuilder(
    column: $table.elapsedDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get scheduledDays => $composableBuilder(
    column: $table.scheduledDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<int> get lapses =>
      $composableBuilder(column: $table.lapses, builder: (column) => column);

  GeneratedColumnWithTypeConverter<RetentionState, int> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  $$CardsTableTableAnnotationComposer get cardId {
    final $$CardsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.cardsTable,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$RetentionTableTableTableManager
    extends
        RootTableManager<
          _$AppDriftDatabase,
          $RetentionTableTable,
          RetentionTableData,
          $$RetentionTableTableFilterComposer,
          $$RetentionTableTableOrderingComposer,
          $$RetentionTableTableAnnotationComposer,
          $$RetentionTableTableCreateCompanionBuilder,
          $$RetentionTableTableUpdateCompanionBuilder,
          (RetentionTableData, $$RetentionTableTableReferences),
          RetentionTableData,
          PrefetchHooks Function({bool cardId})
        > {
  $$RetentionTableTableTableManager(
    _$AppDriftDatabase db,
    $RetentionTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$RetentionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$RetentionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$RetentionTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> cardId = const Value.absent(),
                Value<DateTime> due = const Value.absent(),
                Value<DateTime> lastReview = const Value.absent(),
                Value<double> stability = const Value.absent(),
                Value<double> difficulty = const Value.absent(),
                Value<int> elapsedDays = const Value.absent(),
                Value<int> scheduledDays = const Value.absent(),
                Value<int> reps = const Value.absent(),
                Value<int> lapses = const Value.absent(),
                Value<RetentionState> state = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RetentionTableCompanion(
                cardId: cardId,
                due: due,
                lastReview: lastReview,
                stability: stability,
                difficulty: difficulty,
                elapsedDays: elapsedDays,
                scheduledDays: scheduledDays,
                reps: reps,
                lapses: lapses,
                state: state,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int cardId,
                required DateTime due,
                required DateTime lastReview,
                Value<double> stability = const Value.absent(),
                Value<double> difficulty = const Value.absent(),
                Value<int> elapsedDays = const Value.absent(),
                Value<int> scheduledDays = const Value.absent(),
                Value<int> reps = const Value.absent(),
                Value<int> lapses = const Value.absent(),
                Value<RetentionState> state = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RetentionTableCompanion.insert(
                cardId: cardId,
                due: due,
                lastReview: lastReview,
                stability: stability,
                difficulty: difficulty,
                elapsedDays: elapsedDays,
                scheduledDays: scheduledDays,
                reps: reps,
                lapses: lapses,
                state: state,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$RetentionTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({cardId = false}) {
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
                if (cardId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.cardId,
                            referencedTable: $$RetentionTableTableReferences
                                ._cardIdTable(db),
                            referencedColumn:
                                $$RetentionTableTableReferences
                                    ._cardIdTable(db)
                                    .id,
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

typedef $$RetentionTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDriftDatabase,
      $RetentionTableTable,
      RetentionTableData,
      $$RetentionTableTableFilterComposer,
      $$RetentionTableTableOrderingComposer,
      $$RetentionTableTableAnnotationComposer,
      $$RetentionTableTableCreateCompanionBuilder,
      $$RetentionTableTableUpdateCompanionBuilder,
      (RetentionTableData, $$RetentionTableTableReferences),
      RetentionTableData,
      PrefetchHooks Function({bool cardId})
    >;

class $AppDriftDatabaseManager {
  final _$AppDriftDatabase _db;
  $AppDriftDatabaseManager(this._db);
  $$DecksTableTableTableManager get decksTable =>
      $$DecksTableTableTableManager(_db, _db.decksTable);
  $$CardsTableTableTableManager get cardsTable =>
      $$CardsTableTableTableManager(_db, _db.cardsTable);
  $$RetentionTableTableTableManager get retentionTable =>
      $$RetentionTableTableTableManager(_db, _db.retentionTable);
}
