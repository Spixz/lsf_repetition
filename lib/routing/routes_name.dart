class SingleRoute {
  const SingleRoute(this.name, this.path);

  final String name;
  final String path;

  @override
  String toString() {
    return "name: $name | path: $path";
  }
}

abstract final class Routes {
  static const login = SingleRoute('Login', '/login');
  static const createCard = SingleRoute('Create Card', '/createCard');
  static const library = SingleRoute('List Cards', '/cards');
  static const searchDictionariesResults = SingleRoute(
    'Search in dictionaries results',
    '/searchDictionariesResults',
  );
  static const progress = SingleRoute('Progress', '/progress');
  static const review = SingleRoute('Review', '/review/:title');
  static const settings = SingleRoute('Settings', '/settings');

  static const all = [
    login,
    createCard,
    library,
    searchDictionariesResults,
    progress,
    settings,
  ];
}
