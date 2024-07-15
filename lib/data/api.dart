import 'dart:developer' as logger;

import 'package:flutter_dotenv/flutter_dotenv.dart';

/// A class to fetch the API key and provide it to the app.
class API {
  /// Constructs the singleton instance.
  factory API() => _instance;

  ///Private constructor.
  API._();

  /// Singleton instance
  static final API _instance = API._();

  /// THe Gemini's API key.
  late final String _apiKey;

  /// The API key to use when accessing the Gemini API.
  Future<void> init() async {
    try {
      await dotenv.load();
      _apiKey = dotenv.env['API_KEY'] ?? '';
    } on Exception catch (error, stackTrace) {
      logger.log(
        'error in loading the API_KEY: $error',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Provides the api key.
  String get apiKey => _apiKey;

  /// check if key is provided in ".env" file.
  bool get isLoaded => _apiKey.isNotEmpty;
}
