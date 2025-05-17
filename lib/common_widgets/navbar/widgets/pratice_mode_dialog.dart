
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/common_widgets/navbar/widgets/providers/cards_add_since_field_notifier.dart';
import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/utils/textfield_state.dart';

class PracticeModeDialog extends ConsumerStatefulWidget {
  const PracticeModeDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PracticeModeDialogState();
}

class _PracticeModeDialogState extends ConsumerState<PracticeModeDialog> {
  @override
  void initState() {
    ref.listenManual(cardsAddSinceFieldProvider, _onFormStateChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(cardsAddSinceFieldProvider);

    return AlertDialog(
      title: Text(context.tr("PracticeMode")),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(context.tr("CardsAddSince")),
          TextFormField(
            keyboardType: TextInputType.number,
            autocorrect: false,
            initialValue: formState.defaultValue,
            onChanged: ref.read(cardsAddSinceFieldProvider.notifier).onChange,
            onFieldSubmitted: ref.read(cardsAddSinceFieldProvider.notifier).validate,
          ),
          if (formState.error != null)
            Padding(
              padding: const EdgeInsets.only(top: 13),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  context.tr(
                    formState.error!.i18nIndex,
                    args: formState.error!.args,
                  ),
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(context.tr("Close")),
        ),
        TextButton(
          onPressed:
              () => ref.read(cardsAddSinceFieldProvider.notifier).validate(''),
          child: Text(context.tr("Validate")),
        ),
      ],
    );
  }

  void _onFormStateChange(_, TextFieldState state) {
    if (state.validated) {
      context.pop();
      context.pushNamed(
        Routes.review.name,
        pathParameters: {"title": context.tr("Practice")},
      );
    }
  }
}