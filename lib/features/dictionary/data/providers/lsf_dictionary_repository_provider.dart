import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/features/dictionary/data/repositories/lsf_dictionary_repository_impl.dart';
import 'package:apprendre_lsf/features/dictionary/data/providers/elix_service_provider.dart';

final lsfDictionaryRepositoryProvider = Provider((ref) {
  final elixService = ref.watch(elixProvider);
  return LsfDictionaryRepositoryImpl(dictionnaryService: elixService);
});




