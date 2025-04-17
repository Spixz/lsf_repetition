import 'dart:async';

import 'package:apprendre_lsf/global_providers.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_command/flutter_command.dart';

import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/ui/core/ui/customs_snackbars.dart';
import 'package:apprendre_lsf/ui/decks/create/create_deck_widget_viewmodel.dart';
import 'package:apprendre_lsf/utils/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createDeckProvider =
    NotifierProvider<CreateDeckNotifier, AsyncValue<int>>(
      CreateDeckNotifier.new,
    );

class CreateDeckNotifier extends Notifier<AsyncValue<int>> {
  @override
  build() => AsyncLoading();

  Future call(DeckModel deckModel) async {
    final deckRepository = ref.watch(decksRepositoryProvider);

    try {
      final deckId = await deckRepository.createDeck(deck: deckModel);
      state = AsyncData(deckId);
    } catch (err, st) {
      state = AsyncError(err, st);
    }
  }
}

class CreateDeckWidget extends ConsumerStatefulWidget {
  CreateDeckWidget({
    super.key,
    required this.onSuccess,
  });
  void Function(int deckId) onSuccess;

  @override
  ConsumerState<CreateDeckWidget> createState() => _CreateDeckWidgetState();
}

// ===================== WIDGET ======================

class _CreateDeckWidgetState extends ConsumerState<CreateDeckWidget> {
  final TextEditingController deckNameController = TextEditingController();
  final FocusNode focusNodeDeckName = FocusNode();
  bool isFormValid = false;

  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 200),
      () => focusNodeDeckName.requestFocus(),
    );
    super.initState();
  }

  @override
  void dispose() {
    deckNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(createDeckProvider, (prev, next) {
      next.when(
        data: (createdDeckId) {
          widget.onSuccess(createdDeckId);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(context.tr("CreatedDeck"))));
          Navigator.of(context).pop();
        },
        error: (_, __) {
          ScaffoldMessenger.of(context).showSnackBar(
            ErrorSnackbar(message: context.tr("ErrorDeckCreation")),
          );
        },
        loading: () => null,
      );
    });

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.tr("NameOfTheDeck.title"),
              style: TextStyle(fontSize: 21),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
              child: TextFormField(
                controller: deckNameController,
                focusNode: focusNodeDeckName,
                onChanged:
                    (value) => setState(() {
                      isFormValid = value.trim().isNotEmpty;
                    }),
                onFieldSubmitted: (_) => _createDeck(),
                decoration: InputDecoration(
                  hintText: context.tr("NameOfTheDeck.Hint"),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: isFormValid ? _createDeck : null,
                child: Text(
                  context.tr("Create"),
                  style: TextStyle(
                    color: isFormValid ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createDeck() {
    ref
        .read(createDeckProvider.notifier)
        .call(DeckModel(name: deckNameController.text, description: ""));
  }

}
