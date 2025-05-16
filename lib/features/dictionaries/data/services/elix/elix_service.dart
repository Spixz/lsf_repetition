//jean host raison et sentiment
import 'dart:convert';
import 'dart:io';

import 'package:apprendre_lsf/features/dictionaries/domain/services/dictionary_service.dart';
import 'package:apprendre_lsf/features/dictionaries/data/services/elix/model/elix_search_result.dart';
import 'package:apprendre_lsf/features/dictionaries/data/services/elix/model/elix_suggestion_response.dart';
import 'package:apprendre_lsf/utils/exceptions.dart';
import 'package:apprendre_lsf/utils/has_nested_property.dart';

const elixApi = 'api.elix-lsf.fr';

class ElixService implements DictionaryService {
  ElixService({String? host, HttpClient Function()? clientFactory})
    : _host = host ?? 'dico.elix-lsf.fr',
      _clientFactory = clientFactory ?? HttpClient.new;

  final String _host;
  final HttpClient Function() _clientFactory;

  @override
  Future<List<ElixSearchResult>> searchDefinition(String query) async {
    final client = _clientFactory();
    if (query.isEmpty) {
      throw Exception('Query cannot be empty');
    }

    final HttpClientRequest request = await client.getUrl(
      Uri.https(_host, "/dictionnaire/$query"),
    );
    final HttpClientResponse response = await request.close();

    if (response.statusCode != HttpStatus.ok) {
      response.drain();
      throw HttpException(
        "Invalid response: ${response.statusCode}",
        uri: request.uri,
      );
    }

    final String html = await response.transform(utf8.decoder).join();
    final String? jsonResponse = extractJsonFromHtml(html);

    if (jsonResponse == null) {
      throw Exception('Json response not found inside the elix result page');
    }

    final parsedJson = jsonDecode(jsonResponse) as Map<String, dynamic>;
    final result = elixJsonResponseToElixSearchResults(parsedJson);

    client.close();
    return result;
  }

  @override
  Future<List<String>> searchDefinitionHints({
    required String query,
    required int limit,
    required int page,
  }) async {
    final client = _clientFactory();
    if (query.isEmpty) {
      throw Exception('Query cannot be empty');
    }
    if (limit <= 0 || page <= 0) {
      return throw Exception('Limit and page must be positive');
    }

    final HttpClientRequest request = await client.getUrl(
      Uri.https(elixApi, '/suggests', {
        "q": query,
        "limit": limit.toString(),
        "fuzzy": page.toString(),
      }),
    );
    final HttpClientResponse response = await request.close();

    if (response.statusCode != HttpStatus.ok) {
      final errorBody = await response.transform(utf8.decoder).join();
      throw HttpException(
        "Invalid response: ${response.statusCode}, body: $errorBody",
        uri: request.uri,
      );
    }

    final String rawResponse = await response.transform(utf8.decoder).join();
    final jsonResponse = jsonDecode(rawResponse) as Map<String, dynamic>;
    final hints = ElixSuggestionResponse.safeFromJson(jsonResponse);

    if (hints == null) {
      throw Exception('Invalid api response structure');
    }
    client.close();
    return hints.data;
  }
}

/// Convertis la réponse json de l'api en liste de [ElisSearchResult]
List<ElixSearchResult> elixJsonResponseToElixSearchResults(
  Map<String, dynamic> body,
) {
  if (!hasNestedProperty(body, ['search', 'results'])) {
    throw JsonParseException("Missing properties in the json object");
  }

  if (body['search']['results'] == null) {
    return [];
  }
  final searchResults =
      (body['search']['results'] as List<dynamic>)
          .whereType<Map<String, dynamic>>()
          .toList();
  if (searchResults.isEmpty) {
    return [];
  }

  try {
    return searchResults.map(ElixSearchResult.fromJsonApi).toList();
  } catch (err, st) {
    throw JsonParseException(
      "Error in ElixSearchResult.fromJsonApi during the parsing of the json",
      originalException: err,
      stacktrace: st,
    );
  }
}

/// Extrait la chaîne JSON du `window.__PRELOADED_STATE__` dans la page HTML
String? extractJsonFromHtml(String html) {
  RegExp exp = RegExp(r'window\.__PRELOADED_STATE__ = (.*);');
  RegExpMatch? match = exp.firstMatch(html);
  return match?.group(1);
}
