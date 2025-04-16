import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/data/services/dictionaries/elix/elix_service.dart';

final elixProviderBuilder =
    Provider.family<ElixService, HttpClient Function()?>(
      (ref, client) => ElixService(clientFactory: client),
    );

final elixProvider = elixProviderBuilder(null);
