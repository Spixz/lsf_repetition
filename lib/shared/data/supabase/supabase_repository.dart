import 'dart:async';

import 'package:flutter/material.dart';
import 'package:apprendre_lsf/utils/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SupabaseRepository extends ChangeNotifier {
  late final SupabaseClient _client;
  late final StreamSubscription<AuthState> _authSubscription;
  Session? _session;

  User? get user => _session?.user;

  bool get isLogged => _session != null && !_session!.user.isAnonymous;

  Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://syejfdljlwlzzlogeoia.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN5ZWpmZGxqbHdsenpsb2dlb2lhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc1Njk0MzYsImV4cCI6MjA1MzE0NTQzNn0.s0wpFyI8xNzJQibbHGdsw1YFNAzuF2lDL5bxWTHBNZQ',
    );
    _client = Supabase.instance.client;
    _bindAuthStateChange();
  }

  void _bindAuthStateChange() {
    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((
      data,
    ) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;

      debugPrint('event: $event');
      log.i(session.toString());
      _session = session;

      switch (event) {
        case AuthChangeEvent.initialSession:
          notifyListeners();
          break;
        case AuthChangeEvent.signedIn:
          notifyListeners();
          break;
        case AuthChangeEvent.signedOut:
          notifyListeners();
          break;
        // handle signed out
        case AuthChangeEvent.passwordRecovery:
        // handle password recovery
        case AuthChangeEvent.tokenRefreshed:
        // handle token refreshed
        case AuthChangeEvent.userUpdated:
        // handle user updated
        case AuthChangeEvent.mfaChallengeVerified:
        // handle mfa challenge verified
        default:
          debugPrint("AuthStateChange not handled : $event");
      }
    });
  }

  void getCards() async {
    final data = await Supabase.instance.client.from('countries').select();
  }

  Future<String?> login(String email, String password) async {
    try {
      await _client.auth.signInWithPassword(email: email, password: password);
      return null;
    } on AuthException catch (e) {
      print(e.code);
      return e.code;
    } catch (err) {
      return "Unknown";
    }
  }

  Future<String?> register(String email, String password) async {
    try {
      await _client.auth.signUp(email: email, password: password);
      return null;
    } on AuthException catch (e) {
      print(e.code);
      return e.code;
    } catch (err) {
      return "Unknown";
    }
  }

  void logout() async {
    await _client.auth.signOut();
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }
}
