import 'dart:async';

import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/common_widgets/customs_snackbars.dart';
import 'package:apprendre_lsf/features/cards/view/providers/create_deck_provider.dart';

class CreateDeckDialog extends ConsumerStatefulWidget {
  const CreateDeckDialog({super.key, required this.onSuccess});
  final void Function(int deckId) onSuccess;

  @override
  ConsumerState<CreateDeckDialog> createState() => _CreateDeckWidgetState();
}

class _CreateDeckWidgetState extends ConsumerState<CreateDeckDialog> {
  final FocusNode focusNodeDeckName = FocusNode();

  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 250),
      () => focusNodeDeckName.requestFocus(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isFormValid = ref.watch(deckNameFieldProvider).isValid;
    final submitForm = ref.watch(deckNameFieldProvider.notifier).submit;

    ref.listen(
      createDeckProvider,
      (_, result) => _onDeckCreation(context, result),
    );

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
                focusNode: focusNodeDeckName,
                onChanged: ref.read(deckNameFieldProvider.notifier).update,
                onFieldSubmitted: (_) => submitForm(),
                decoration: InputDecoration(
                  hintText: context.tr("NameOfTheDeck.Hint"),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: isFormValid ? submitForm : null,
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

  void _onDeckCreation(BuildContext context, AsyncValue<int> result) {
    result.when(
      data: (createdDeckId) {
        widget.onSuccess(createdDeckId);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.tr("CreatedDeck"))));
        Navigator.of(context).pop();
      },
      error: (_, __) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(ErrorSnackbar(message: context.tr("ErrorDeckCreation")));
      },
      loading: () => null,
    );
  }
}
