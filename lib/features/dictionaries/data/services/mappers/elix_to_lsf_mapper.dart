import 'package:apprendre_lsf/features/dictionaries/data/services/elix/model/elix_meaning.dart';
import 'package:apprendre_lsf/features/dictionaries/data/services/elix/model/elix_media.dart';
import 'package:apprendre_lsf/features/dictionaries/domain/models/lsf_dictionary_meaning.dart';
import 'package:apprendre_lsf/features/dictionaries/domain/models/lsf_dictionary_media.dart';

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
