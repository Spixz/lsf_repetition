import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_search_result.dart';

abstract interface class DictionarySearchRawResult {
  LsfDictionarySearchResult toLSFDictionaryResult();
}