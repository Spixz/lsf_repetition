import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CreateCardStep { selectDeck, addDetails, review }

final createCardStepProvider =
    NotifierProvider<CurrentStepNotifier, CreateCardStep>(
      CurrentStepNotifier.new,
    );

class CurrentStepNotifier extends Notifier<CreateCardStep> {
  @override
  build() => CreateCardStep.selectDeck;

  void updateFromPageIndex(int index) {
    state =
        CreateCardStep.values.elementAtOrNull(index) ??
        CreateCardStep.selectDeck;
  }
}