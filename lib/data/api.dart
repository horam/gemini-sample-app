class API {
  /// The API key to use when accessing the Gemini API.
  static const String apiKey = String.fromEnvironment('API_KEY');

  bool get isLoaded => apiKey.isNotEmpty;
}
