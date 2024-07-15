import 'package:flutter_dotenv/flutter_dotenv.dart';

/// A class to fetch the API key and provide it to the app.
class API {
  late final String? _apiKey;

  /// The API key to use when accessing the Gemini API.
  Future<void> init() async {
    await dotenv.load();
    _apiKey = dotenv.env['API_KEY'];
  }

  /// Provides the api key.
  String get apiKey => _apiKey ?? '';

  /// check if key is provided in ".env" file.
  bool get isLoaded => _apiKey != null && _apiKey.isNotEmpty;
}
