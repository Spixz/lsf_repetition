import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_command/flutter_command.dart';

import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/ui/core/ui/customs_snackbars.dart';
import 'package:apprendre_lsf/ui/decks/create/create_deck_widget_viewmodel.dart';
import 'package:apprendre_lsf/utils/result.dart';

class CreateDeckWidget extends StatefulWidget {
  CreateDeckWidget(
      {super.key, required this.viewModel, required this.onSuccess});
  final CreateDeckWidgetViewmodel viewModel;
  void Function(int deckId) onSuccess;

  @override
  State<CreateDeckWidget> createState() => _CreateDeckWidgetState();
}

class _CreateDeckWidgetState extends State<CreateDeckWidget> {
  final TextEditingController deckNameController = TextEditingController();
  final FocusNode focusNodeDeckName = FocusNode();
  late ListenableSubscription createDeckSubscription;

  @override
  void initState() {
    createDeckSubscription =
        widget.viewModel.createDeck.results.listen(_onDeckCreation);
    Future.delayed(
        Duration(milliseconds: 200), () => focusNodeDeckName.requestFocus());
    super.initState();
  }

  @override
  void dispose() {
    deckNameController.dispose();
    createDeckSubscription.cancel();
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.tr("NameOfTheDeck.title"),
                style: TextStyle(fontSize: 21)),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
              child: TextFormField(
                controller: deckNameController,
                focusNode: focusNodeDeckName,
                onChanged: (value) => widget.viewModel.validateFrom(value),
                onFieldSubmitted: (_) => _createDeck(),
                decoration:
                    InputDecoration(hintText: context.tr("NameOfTheDeck.Hint")),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: widget.viewModel.isFormValid,
              builder: (_, isValid, __) {
                return Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: isValid ? _createDeck : null,
                    child: Text(
                      context.tr("Create"),
                      style: TextStyle(
                          color: isValid ? Colors.black : Colors.grey),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _createDeck() {
    widget.viewModel.createDeck
        .execute(DeckModel(name: deckNameController.text, description: ""));
  }

  void _onDeckCreation(
      CommandResult<DeckModel?, Result<int>> result, subcription) {
    if (result.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(ErrorSnackbar(
          message:
              result.error?.toString() ?? context.tr("ErrorDeckCreation")));
    } else if (result.hasData) {
      if (result.data is Ok) {
        final deckId = (result.data as Ok).value;
        widget.onSuccess(deckId);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(context.tr("CreatedDeck"))));
        Navigator.of(context).pop();
      } else {
        Exception exception = (result.data as Error).error;
        ScaffoldMessenger.of(context)
            .showSnackBar(ErrorSnackbar(message: exception.toString()));
      }
    }
  }
}
