import 'package:apprendre_lsf/data/services/dictionaries/elix/model/elix_meaning.dart';
import 'package:apprendre_lsf/data/services/dictionaries/elix/model/elix_media.dart';
import 'package:apprendre_lsf/data/services/dictionaries/elix/model/elix_search_result.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_media.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';

extension ElixMediaToLsfDictionaryMedia on ElixMedia {
  LsfDictionaryMedia toLsfDictionaryMedia() =>
      LsfDictionaryMedia(videoUrl: uri, imageUrl: image, author: author);
}

extension ElixMeaningToLsfDictionaryMeaning on ElixMeaning {
  LsfDictionaryMeaning toLsfDictionaryMeaning() => LsfDictionaryMeaning(
    definition: definition,
    wordSigns: wordSigns.map((sign) => sign.toLsfDictionaryMedia()).toList(),
    definitionSigns:
        definitionSigns
            .map((definition) => definition.toLsfDictionaryMedia())
            .toList(),
  );
}

extension ElixToLsfDictionaryResultExtension on ElixSearchResult {
  LsfDictionarySearchResult toLSFDictionaryResult() =>
      LsfDictionarySearchResult.lsfDictionarySearchResult(
        dictionaryName: LsfDictionaryName.elix,
        name: name,
        typology: typology,
        language: 'fr',
        meanings:
            meanings
                .map((meaning) => meaning.toLsfDictionaryMeaning())
                .toList(),
      );
}
