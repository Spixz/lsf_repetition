import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';

CardModel cardModelFromMeaningOfResult(
  LsfDictionarySearchResult searchResult,
  LsfDictionaryMeaning meaning,
) {
  return CardModel(
    name: searchResult.name,
    typology: searchResult.typology,
    meaning: meaning.definition,
    videosSigns: meaning.wordSigns.map((sign) => sign.videoUrl).toList(),
    sourceDictionnary: searchResult.dictionaryName,
    dictionnarySignId: -1,
  );
}
