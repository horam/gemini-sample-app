import 'package:gemini_app/core/core.dart';
import 'package:gemini_app/data/api.dart';
import 'package:http/http.dart' as http;
import 'package:google_generative_ai/google_generative_ai.dart';

/// A class for change the AI model settings.
class GeminiSettings {
  /// Class private constructor.
  GeminiSettings();

  /// initialize a Gemini Flesh model.
  static GenerativeModel initGeminiFlesh({
    List<SafetySetting> safetySettings = const [],
    GenerationConfig? generationConfig,
    List<Tool>? tools,
    http.Client? httpClient,
    RequestOptions? requestOptions,
    Content? systemInstruction,
    ToolConfig? toolConfig,
  }) =>
      GenerativeModel(
        model: ModelType.geminiFlash.name,
        apiKey: API.apiKey,
        safetySettings: safetySettings,
        generationConfig: generationConfig,
        toolConfig: toolConfig,
        tools: tools,
        httpClient: httpClient,
        requestOptions: requestOptions,
        systemInstruction: systemInstruction,
      );

  /// initialize a Gemini Pro model.
  static GenerativeModel initGeminiPro({
    List<SafetySetting> safetySettings = const [],
    GenerationConfig? generationConfig,
    List<Tool>? tools,
    http.Client? httpClient,
    RequestOptions? requestOptions,
    Content? systemInstruction,
    ToolConfig? toolConfig,
  }) =>
      GenerativeModel(
        model: ModelType.geminiPro.name,
        apiKey: API.apiKey,
        safetySettings: safetySettings,
        generationConfig: generationConfig,
        toolConfig: toolConfig,
        tools: tools,
        httpClient: httpClient,
        requestOptions: requestOptions,
        systemInstruction: systemInstruction,
      );

  /// initialize a Text Embedding model.
  static GenerativeModel initGeminiTextEmbedding({
    List<SafetySetting> safetySettings = const [],
    GenerationConfig? generationConfig,
    List<Tool>? tools,
    http.Client? httpClient,
    RequestOptions? requestOptions,
    Content? systemInstruction,
    ToolConfig? toolConfig,
  }) =>
      GenerativeModel(
        model: ModelType.textEmbedding.name,
        apiKey: API.apiKey,
        safetySettings: safetySettings,
        generationConfig: generationConfig,
        toolConfig: toolConfig,
        tools: tools,
        httpClient: httpClient,
        requestOptions: requestOptions,
        systemInstruction: systemInstruction,
      );

  /// initialize an AQA model.
  static GenerativeModel initAqa({
    List<SafetySetting> safetySettings = const [],
    GenerationConfig? generationConfig,
    List<Tool>? tools,
    http.Client? httpClient,
    RequestOptions? requestOptions,
    Content? systemInstruction,
    ToolConfig? toolConfig,
  }) =>
      GenerativeModel(
        model: ModelType.aqa.name,
        apiKey: API.apiKey,
        safetySettings: safetySettings,
        generationConfig: generationConfig,
        toolConfig: toolConfig,
        tools: tools,
        httpClient: httpClient,
        requestOptions: requestOptions,
        systemInstruction: systemInstruction,
      );
}
