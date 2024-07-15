import 'dart:developer' as logger;
import 'dart:io';

import 'package:gemini_app/core/enums/enums.dart';
import 'package:gemini_app/data/models/models.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

/// Class name for logging purposes.

class ChatRepository {
  late GenerativeModel? _model;
  late ChatSession? _chat;
  ModelType _modelType = ModelType.defaultModel;
  final List<ChatContent> _generatedContent = <ChatContent>[];

  /// class name to be used in our logs.
  static const tag = 'ChatRepository';

  /// All of generated contents.
  List<ChatContent> get contents => _generatedContent;

  /// number of contents.
  int get contentCount => _generatedContent.length;

  /// Chosen model type name.
  String get modelName => _modelType.name;

  /// Chosen model name.
  ModelType get model => _modelType;

  /// Initialize a chat with Gemini model.
  void init({required ModelSettings settings}) {
    _generatedContent.clear();
    _modelType = settings.type;
    _model = GeminiModel.init(settings: settings);
    _chat = _model!.startChat();
  }

  /// Adding users' message to the content.
  void addMessageToContent(String message) {
    _generatedContent.add(ChatContent.messageFromUserPrompt(text: message));
  }

  /// Sending users' message to the model.
  Future<String?> sendTextMessage(String message) async {
    String? text;
    try {
      /// send the prompt to the AI model.
      final response = await _chat!.sendMessage(Content.text(message));

      /// receive the response and save it locally.
      _generatedContent.add(ChatContent.messageFromAI(text: response.text));
    } on Exception catch (error, stackTrace) {
      logger.log(
        '$tag:error in sending message. error: $error',
        stackTrace: stackTrace,
      );
      rethrow;
    }
    return text;
  }

  /// send image from user to the model.
  Future<String?> sendImagePrompt(String message) async {
    String? text;
    try {
      /// Send the prompt to AI and save it locally.
      final picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 100,
        maxWidth: 100,
      );
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        final content = [
          /// load multi modal prompt.
          Content.multi(
            [
              TextPart(message),
              // The only accepted mime types are image/*.
              DataPart(
                'image/jpeg',
                file.readAsBytesSync(),
              ),
            ],
          ),
        ];
        _generatedContent.add(
          ChatContent.imageFromUserPrompt(
            path: pickedFile.path,
            text: message,
          ),
        );

        /// save the response to show it on the chat screen.
        final response = await _model!.generateContent(content);
        _generatedContent.add(ChatContent.messageFromAI(text: response.text));
      }
    } on Exception catch (error, stackTrace) {
      logger.log(
        '$tag:error in sending image prompts. error: $error',
        stackTrace: stackTrace,
      );
      rethrow;
    }

    return text;
  }
}
