import 'package:gemini_app/core/core.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// A class for change the AI model settings.
class ModelSettings {
  /// Class constructor.
  ModelSettings({
    this.type = ModelType.geminiFlash,
    this.safetySettings,
    this.generationConfig,
  });

  /// Build an instance of the class from user's choice.
  factory ModelSettings.fromUser({
    required String modelName,
    required String temperature,
    required String maxOutputTokens,
    required String topP,
    required String topK,
    required String candidateCount,
    required String category,
    required String threshold,
  }) {
    final GenerationConfig config = GenerationConfig(
      temperature: double.tryParse(temperature),
      maxOutputTokens: int.tryParse(maxOutputTokens),
      topP: double.tryParse(topP),
      topK: int.tryParse(topK),
      candidateCount: int.tryParse(candidateCount),
    );
    // model type.
    final ModelType type = ModelType.fromText(modelName);
    late final List<SafetySetting>? safetySettings;
    // safety settings.
    if (category != HarmType.defaultCategory &&
        threshold != BlockThreshold.defaultThresholdLevel) {
      final HarmCategory harmCategory = HarmType.fromText(category);
      final HarmBlockThreshold blockThreshold =
          BlockThreshold.fromText(threshold);
      safetySettings = [SafetySetting(harmCategory, blockThreshold)];
    } else {
      safetySettings = const [];
    }
    return ModelSettings(
      type: type,
      safetySettings: safetySettings,
      generationConfig: config,
    );
  }

  /// Safety settings for a category changes the allowed probability that
  /// content is blocked.
  final List<SafetySetting>? safetySettings;

  /// Configuration options for [GenerativeModel] generation and outputs.
  final GenerationConfig? generationConfig;

  /// [GenerativeModel] type.
  final ModelType type;
}
