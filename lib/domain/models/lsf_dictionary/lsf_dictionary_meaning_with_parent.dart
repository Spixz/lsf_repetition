import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';

class LsfDictionaryMeaningWithParent {
  const LsfDictionaryMeaningWithParent({
    required this.parent,
    required this.meaning,
  });
  final LsfDictionarySearchResult parent;
  final LsfDictionaryMeaning meaning;

  Card get toCardModel => Card(
    name: parent.name,
    typology: parent.typology,
    meaning: meaning.definition,
    videosSigns: meaning.wordSigns.map((sign) => sign.videoUrl).toList(),
    sourceDictionnary: parent.dictionaryName,
    dictionnarySignId: -1,
  );
}
