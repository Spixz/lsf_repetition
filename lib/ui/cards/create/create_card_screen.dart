import 'package:apprendre_lsf/domain/models/card_model/card_model.dart';
import 'package:apprendre_lsf/global_providers.dart';
import 'package:apprendre_lsf/utils/extensions/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:apprendre_lsf/ui/core/ui/customs_snackbars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:provider/provider.dart';

import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/ui/cards/create/create_card_viewmodel.dart';
import 'package:apprendre_lsf/ui/core/ui/empty.dart';
import 'package:apprendre_lsf/ui/decks/create/create_deck_widget.dart';
import 'package:apprendre_lsf/ui/decks/create/create_deck_widget_viewmodel.dart';
import 'package:apprendre_lsf/utils/result.dart';

final currentPageProvider =
    NotifierProvider<CurrentPageNotifier, CreateCardStep>(
      CurrentPageNotifier.new,
    );

class CurrentPageNotifier extends Notifier<CreateCardStep> {
  @override
  build() => CreateCardStep.selectDeck;

  void updateFromPageIndex(int index) {
    state =
        CreateCardStep.values.elementAtOrNull(index) ??
        CreateCardStep.selectDeck;
  }
}

final createCardsProvider =
    NotifierProvider<CreateCardNotifier, AsyncValue<void>>(
      CreateCardNotifier.new,
    );

class CreateCardNotifier extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() => AsyncLoading();

  Future call({required CardModel card, required List<int> deckIds}) async {
    final deckRepository = ref.watch(decksRepositoryProvider);

    try {
      state = AsyncLoading();
      final cardsToAdd = deckIds.map((deckId) => card.copyWith(deckId: deckId));
      deckRepository.createCards(cards: cardsToAdd.toList());
      state = AsyncData(null);
    } catch (err, st) {
      state = AsyncError(err, st);
    }
  }
}

final allDecksProviders = AutoDisposeFutureProvider((ref) {
  final decksRepository = ref.watch(decksRepositoryProvider);
  return decksRepository.getAllDecks();
});

final selectedDecksProvider =
    AutoDisposeNotifierProvider<SelectedDecksNotifier, List<int>>(
      SelectedDecksNotifier.new,
    );

class SelectedDecksNotifier extends AutoDisposeNotifier<List<int>> {
  @override
  List<int> build() => [];

  void add(int deckId) => state = state + [deckId];
  void remove(int deckId) =>
      state = List.of(state)..remove(deckId); //pas sence marcher
}

///  ======================== WIDGET =======================

class CreateCardScreen extends ConsumerStatefulWidget {
  const CreateCardScreen({super.key, required CardModel cardToCreate})
    : card = cardToCreate;
  final CardModel card;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateCardScreenState();
}

class _CreateCardScreenState extends ConsumerState<CreateCardScreen> {
  @override
  void initState() {
    // _onCardsCreated(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onChange = ref.read(currentPageProvider.notifier).updateFromPageIndex;
    ref.listen(createCardsProvider, (prev, next) {
      next.when(
        data: (data) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SuccessSnackbar(message: context.tr("CreatedCard")));
          Navigator.of(context).pop();
        },
        error: (err, st) {
          debugPrint(err.toString());
          debugPrintStack(stackTrace: st);
          ScaffoldMessenger.of(context).showSnackBar(
            ErrorSnackbar(message: context.tr("unexpectedErrorHasOccurred")),
          );
        },
        loading: () => null,
      );
    });

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          PageView(
            // controller: PageController(),
            onPageChanged: onChange,
            children: <Widget>[SizedBox.expand(child: SelectDecks())],
          ),
          _nextButton(),
        ],
      ),
      floatingActionButton: _FAB(),
    );
  }

  Widget _nextButton() {
    final selectedDecks = ref.watch(selectedDecksProvider);
    final enabled = selectedDecks.isNotEmpty;

    return Positioned(
      bottom: 100,
      child: SizedBox(
        width: context.width,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              if (enabled) {
                ref
                    .read(createCardsProvider.notifier)
                    .call(card: widget.card, deckIds: selectedDecks);
                return;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                WarningSnackbar(message: context.tr("SelectAtLeastOneDeck")),
              );
            },
            style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size(50, 40)),
              elevation: WidgetStatePropertyAll(enabled ? 10 : 4),
              backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.error)) {
                  return Colors.red;
                }
                return enabled
                    ? Colors.purple.shade200
                    : Colors.purple.shade200.withAlpha(150);
              }),
              textStyle: WidgetStatePropertyAll(
                TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w300,
                ),
              ),
            ),
            child: Text(
              context.tr("Next"),
              style: TextStyle(
                color: enabled ? Colors.black : Colors.black.withAlpha(100),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FAB extends ConsumerWidget {
  const _FAB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);

    return switch (currentPage) {
      CreateCardStep.selectDeck => FloatingActionButton(
        tooltip: context.tr("CreateADeck"),
        onPressed:
            () => showDialog(
              context: context,
              builder:
                  (_) => CreateDeckWidget(
                    //TODO riv onSuccess: widget.viewModel.onCreateDeckSuccess,
                    onSuccess: (int c) => null,
                  ),
            ),
        child: const Icon(Icons.add),
      ),
      _ => Empty(),
    };
  }
}

class SelectDecks extends ConsumerWidget {
  const SelectDecks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDecks = ref.watch(allDecksProviders);
    final selectedDecksIds = ref.watch(selectedDecksProvider);

    return allDecks.when(
      data: (allDecks) {
        if (allDecks.isEmpty) {
          return _createFirstDeckMessage(context);
        }
        return _buildAllDecksCheckbox(ref, allDecks, selectedDecksIds);
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (_, __) => Center(child: Text(context.tr("AnErrorHasOccured"))),
    );
  }

  Widget _createFirstDeckMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Text(
          context.tr("CreateADeckBefore"),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildAllDecksCheckbox(
    WidgetRef ref,
    List<DeckModel> allDecks,
    List<int> selectedDecksIds,
  ) {
    return ListView.builder(
      itemCount: allDecks.length,
      itemBuilder: (_, index) {
        final deck = allDecks[index];
        final isSelected = selectedDecksIds.contains(deck.id);

        return CheckboxListTile(
          value: isSelected,
          onChanged: (value) {
            if (isSelected) {
              return ref.read(selectedDecksProvider.notifier).remove(deck.id!);
            } else {
              return ref.read(selectedDecksProvider.notifier).add(deck.id!);
            }
          },
          title: Text(deck.name),
        );
      },
    );
  }
}


// class AllDecksCheckbox extends ConsumerWidget {
//   const AllDecksCheckbox({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ListView.builder(
//       itemCount: allDecks.length,
//       itemBuilder: (_, index) {
//         final deck = allDecks[index];
//         final isSelected = selectedDecksIds.contains(deck.id);

//         return CheckboxListTile(
//           value: isSelected,
//           onChanged: (value) {
//             if (isSelected) {
//               return ref.read(selectedDecksProvider.notifier).remove(deck.id!);
//             } else {
//               return ref.read(selectedDecksProvider.notifier).add(deck.id!);
//             }
//           },
//           title: Text(deck.name),
//         );
//       },
//     );
//   }
//   }