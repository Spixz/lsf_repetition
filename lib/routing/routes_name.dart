class Route {
  final String name;
  final String path;

  const Route(this.name, this.path);
}

abstract final class Routes {
  static const home = Route('Home', '/home');
  static const login = Route('Login', '/login'); 
  static const mouseController = Route('Mouse controller', '/mouse');
  static const createCard = Route('Create Card', '/createCard');
  static const searchDictionariesResults = Route('Search in dictionaries results', '/searchDictionariesResults');
}