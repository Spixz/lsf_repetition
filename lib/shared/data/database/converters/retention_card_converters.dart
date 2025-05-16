// stores RetentionCard as strings
import 'dart:convert';

import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';
import 'package:drift/drift.dart';

class RetentionCardConverter extends TypeConverter<RetentionCard, String>
    with JsonTypeConverter2<RetentionCard, String, Map<String, Object?>> {
  const RetentionCardConverter();

  @override
  String toSql(RetentionCard value) {
    // Pour la BDD, on encode en chaîne
    return jsonEncode(value.toJson());
  }

  @override
  RetentionCard fromSql(String fromDb) {
    return RetentionCard.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  // IMPORTANT : pour le JSON final, on renvoie un vrai Map, pas une String
  @override
  Map<String, dynamic> toJson(RetentionCard value) {
    return value.toJson();
  }

  @override
  RetentionCard fromJson(Map<String, dynamic> json) {
    return RetentionCard.fromJson(json);
  }
}
