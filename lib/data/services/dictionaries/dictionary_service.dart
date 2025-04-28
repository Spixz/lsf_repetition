import 'package:apprendre_lsf/utils/result.dart';

abstract interface class DictionaryService<T extends Object> {
  Future<T> searchDefinition(String query);
  Future<List<String>> searchDefinitionHints({
    required String query,
    required int limit,
    required int page,
  });
}
