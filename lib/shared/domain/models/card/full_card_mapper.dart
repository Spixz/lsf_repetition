import 'package:apprendre_lsf/shared/domain/models/card/card.dart';
import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';
import 'package:apprendre_lsf/features/dictionaries/domain/models/lsf_dictionary_meaning.dart';
import 'package:apprendre_lsf/features/dictionaries/domain/models/lsf_dictionary_search_result.dart';

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
