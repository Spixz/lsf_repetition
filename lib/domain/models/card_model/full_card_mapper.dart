import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/domain/models/card_model/full_card.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';

class FullCardMapper {
  static FullCard fromLsfDictionnaryResults({
    required LsfDictionarySearchResult searchOutput,
    required LsfDictionaryMeaning selectedMeaning,
  }) {
    return FullCard(
      card: CardModel(
        name: searchOutput.name,
        typology: searchOutput.typology,
        meaning: selectedMeaning.definition,
        videosSigns:
            selectedMeaning.wordSigns.map((sign) => sign.videoUrl).toList(),
        sourceDictionnary: searchOutput.dictionaryName,
        dictionnarySignId: -1,
      ),
    );
  }
}
