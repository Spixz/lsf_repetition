import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:apprendre_lsf/ui/core/ui/customs_snackbars.dart';

import 'package:provider/provider.dart';

import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/ui/cards/create/create_card_viewmodel.dart';
import 'package:apprendre_lsf/ui/core/ui/empty.dart';
import 'package:apprendre_lsf/ui/decks/create/create_deck_widget.dart';
import 'package:apprendre_lsf/ui/decks/create/create_deck_widget_viewmodel.dart';
import 'package:apprendre_lsf/utils/result.dart';

class CreateCardScreen extends StatefulWidget {
  const CreateCardScreen({super.key, required this.viewModel});
  final CreateCardViewmodel viewModel;

  @override
  State<CreateCardScreen> createState() => _CreateCardScreenState();
}

class _CreateCardScreenState extends State<CreateCardScreen> {
  late ListenableSubscription onCardsCreatedSubscription;

  @override
  void initState() {
    onCardsCreatedSubscription =
        widget.viewModel.createCards.results.listen(_onCardsCreated);
    super.initState();
  }

  @override
  void dispose() {
    onCardsCreatedSubscription.cancel();
    widget.viewModel.dispose();
    super.dispose();
  }

  void _onCardsCreated(
      CommandResult<void, Result<void>> result, ListenableSubscription _) {
    if (result.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
          ErrorSnackbar(message: context.tr("unexpectedErrorHasOccurred")));
      debugPrint(result.error?.toString());
      debugPrintStack(stackTrace: result.stackTrace);
    } else if (result.hasData) {
      if (result.data is Error) {
        ScaffoldMessenger.of(context).showSnackBar(
            ErrorSnackbar(message: context.tr("expectedErrorHasOccurred")));
        debugPrint((result.error as Error).error.toString());
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SuccessSnackbar(message: context.tr("CreatedCard")));
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        PageView(
          controller: widget.viewModel.pageViewController,
          onPageChanged: widget.viewModel.onPageChange,
          children: <Widget>[
            SizedBox.expand(child: SelectDecks(viewModel: widget.viewModel)),
          ],
        ),
        _nextButton(),
      ]),
      floatingActionButton: _createFAB(),
    );
  }

  Widget _nextButton() {
    final size = MediaQuery.of(context).size;
    return ValueListenableBuilder(
        valueListenable: widget.viewModel.selectedDecksIds,
        builder: (_, selectedDecksIds, __) {
          bool enabled = selectedDecksIds.isNotEmpty;

          return Positioned(
              bottom: 100,
              child: SizedBox(
                width: size.width,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (enabled) {
                        return widget.viewModel.createCards();
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                          WarningSnackbar(
                              message: context.tr("SelectAtLeastOneDeck")));
                    },
                    style: ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(Size(50, 40)),
                        elevation: WidgetStatePropertyAll(enabled ? 10 : 4),
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color?>(
                                (Set<WidgetState> states) {
                          if (states.contains(WidgetState.error)) {
                            return Colors.red;
                          }
                          return enabled
                              ? Colors.purple.shade200
                              : Colors.purple.shade200.withAlpha(150);
                        }),
                        textStyle: WidgetStatePropertyAll(TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.w300,
                        ))),
                    child: Text(
                      context.tr("Next"),
                      style: TextStyle(
                          color: enabled
                              ? Colors.black
                              : Colors.black.withAlpha(100)),
                    ),
                  ),
                ),
              ));
        });
  }

  FloatingActionButton? _createFAB() {
    final CreateDeckWidgetViewmodel deckViewModel =
        CreateDeckWidgetViewmodel(deckRepository: context.read());

    return switch (widget.viewModel.currentPage) {
      CreateCardStep.selectDeck => FloatingActionButton(
          tooltip: context.tr("CreateADeck"),
          onPressed: () => showDialog(
              context: context,
              builder: (_) => CreateDeckWidget(
                    viewModel: deckViewModel,
                    onSuccess: widget.viewModel.onCreateDeckSuccess,
                  )),
          child: const Icon(Icons.add),
        ),
      _ => null
    };
  }
}

class SelectDecks extends StatefulWidget {
  const SelectDecks({super.key, required this.viewModel});
  final CreateCardViewmodel viewModel;

  @override
  State<SelectDecks> createState() => _SelectDecksState();
}

class _SelectDecksState extends State<SelectDecks> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CommandResult<void, Result<List<DeckModel>>>>(
        valueListenable: widget.viewModel.getAllDecks.results,
        builder: (_, results, __) {
          if (results.isExecuting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (results.hasError) {
            return Center(
              child: Text(context.tr("AnErrorHasOccured")),
            );
          } else if (results.hasData) {
            if (results.data is Ok) {
              final decks = (results.data as Ok).value as List<DeckModel>;
              if (decks.isEmpty) {
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
              return BuildDeckList(viewModel: widget.viewModel, decks: decks);
            }
          }
          return Empty();
        });
  }
}

class BuildDeckList extends StatelessWidget {
  final CreateCardViewmodel viewModel;
  final List<DeckModel> decks;

  const BuildDeckList(
      {super.key, required this.viewModel, required this.decks});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: viewModel.selectedDecksIds,
        builder: (_, selectedDecksIds, __) {
          return ListView.builder(
              itemCount: decks.length,
              itemBuilder: (_, index) {
                final deck = decks[index];
                final isSelected = selectedDecksIds.contains(deck.id);

                return CheckboxListTile(
                    value: isSelected,
                    onChanged: (value) {
                      if (isSelected) {
                        return viewModel.removeFromSelectedDecks(deck.id!);
                      } else {
                        return viewModel.addDeckToSelectedDecks(deck.id!);
                      }
                    },
                    title: Text(deck.name));
              });
        });
  }
}
