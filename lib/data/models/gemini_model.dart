import 'package:gemini_app/data/data.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// A wrapper for a Gemini AI model.
class GeminiModel {
  /// Initialize the model.
  static GenerativeModel init({required ModelSettings settings}) =>
      GenerativeModel(
        model: settings.type.name,
        apiKey: API().apiKey,
        safetySettings: settings.safetySettings ?? const [],
        generationConfig: settings.generationConfig,
      );
}
