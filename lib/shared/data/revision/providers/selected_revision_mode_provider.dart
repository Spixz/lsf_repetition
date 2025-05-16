import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/shared/domain/usescases/revision_logic.dart';

final selectedRevisionModeProvider = StateProvider(
  (_) => RevisionMode.training,
);