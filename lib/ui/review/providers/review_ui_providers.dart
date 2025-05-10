import 'package:flutter_riverpod/flutter_riverpod.dart';

final reverseCardProvider = StateProvider<bool>((ref) => false);

final showAnswerProvider = AutoDisposeStateProvider<bool>((ref) => false);

final indexVideoSelectedRevisionScreenProvider = StateProvider((ref) => 0);