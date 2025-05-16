import 'package:apprendre_lsf/features/dictionaries/domain/models/lsf_dictionary_search_result.dart';

abstract interface class DictionarySearchRawResult {
  LsfDictionarySearchResult toLSFDictionaryResult();
}