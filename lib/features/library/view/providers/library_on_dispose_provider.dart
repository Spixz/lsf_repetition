import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/features/library/view/providers/card_filter_notifier.dart';

enum LibraryTab { decks, cards }

final libraryOnDisposeProvider = AutoDisposeProvider((ref) {
  ref.onDispose(() => ref.read(cardsFilterProvider.notifier).updateDeck(null));
});
