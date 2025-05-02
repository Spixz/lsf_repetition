import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/data/repositories/decks/deck_repository_provider.dart';

enum LibraryTab { decks, cards }

final libraryOnDisposeProvider = AutoDisposeProvider((ref) {
  ref.onDispose(() => ref.read(cardsFilterProvider.notifier).updateDeck(null));
});
