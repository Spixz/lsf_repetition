class TrError {
  TrError({required this.i18nIndex, this.args = const []});
  final String i18nIndex;
  final List<String> args;
}

class TextFieldState {
  TextFieldState({
    required this.value,
    this.defaultValue,
    this.error,
    this.validated = false,
  });
  final String value;
  final String? defaultValue;
  final TrError? error;
  final bool validated;

  TextFieldState copyWith({
    String? value,
    String? defaultValue,
    TrError? error,
    bool? validated,
  }) {
    return TextFieldState(
      value: value ?? this.value,
      defaultValue: defaultValue ?? this.defaultValue,
      error: error ?? this.error,
      validated: validated ?? this.validated,
    );
  }
}
