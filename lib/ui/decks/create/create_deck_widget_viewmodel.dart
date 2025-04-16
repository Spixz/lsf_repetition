import 'package:flutter/foundation.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:apprendre_lsf/data/repositories/decks/decks_repository.dart';
import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/utils/result.dart';

class CreateDeckWidgetViewmodel {
  final DecksRepository _decksRepository;
  late Command<DeckModel, Result<int>> createDeck;
  final ValueNotifier<bool> _isFormValid = ValueNotifier(false);

  CreateDeckWidgetViewmodel({required DecksRepository deckRepository})
      : _decksRepository = deckRepository {
    createDeck = Command.createAsync(_createDeck, initialValue: Result.ok(-1));
  }

  void dispose() {
    createDeck.dispose();
    _isFormValid.dispose();
  }

  ValueListenable<bool> get isFormValid => _isFormValid;

  void validateFrom(String value) {
    _isFormValid.value = value.trim().isNotEmpty;
  }

  Future<Result<int>> _createDeck(DeckModel deck) async {
    return _decksRepository.createDeck(deck: deck);
  }
}
