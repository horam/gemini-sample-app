import 'package:flutter/services.dart';
import 'package:gemini_app/core/enums/enums.dart';
import 'package:gemini_app/data/models/content.dart';
import 'package:gemini_app/data/models/gemini_settings.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:developer' as logger;

import 'package:image_picker/image_picker.dart';

class ChatRepository {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final List<ChatContent> _generatedContent = <ChatContent>[];

  static const TAG = 'ChatRepository';

  void init() {
    _model = GeminiSettings.initGeminiFlesh(
      safetySettings: [
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
      ],
    );
    _chat = _model.startChat();
  }

  void update(ModelType type) {
    // clear the chat cache.
    _generatedContent.clear();
  }

  List<ChatContent> get contents => _generatedContent;

  int get contentCount => _generatedContent.length;

  Future<String?> sendMessage(String message) async {
    String? text;
    try {
      /// save the prompt locally and send it to the AI.
      _generatedContent.add(ChatContent.messageFromUserPrompt(text: message));
      final response = await _chat.sendMessage(Content.text(message));

      /// receive the response and save it locally.
      final text = response.text;
      _generatedContent.add(ChatContent.messageFromAI(text: text));
    } catch (error, stackTrace) {
      logger.log('$TAG:error in sending message. error: $error',
          stackTrace: stackTrace);
      rethrow;
    }
    return text;
  }

  Future<String?> sendImagePrompt(String message) async {
    String? text;
    try {
      /// Send the prompt to AI and save it locally.
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        ByteData imageBytes = await rootBundle.load(pickedFile.path);
        final content = [
          /// load multi modal prompt.
          Content.multi([
            TextPart(message),
            // The only accepted mime types are image/*.
            DataPart('image/jpeg', imageBytes.buffer.asUint8List()),
          ])
        ];
        _generatedContent.add(ChatContent.imageFromUserPrompt(
          imageName: pickedFile.path,
          text: message,
        ));

        /// save the response to show it on the chat screen.
        var response = await _model.generateContent(content);
        var text = response.text;
        _generatedContent.add(ChatContent.messageFromAI(text: text));
      }
    } catch (error, stackTrace) {
      logger.log('$TAG:error in sending image prompts. error: $error',
          stackTrace: stackTrace);
      rethrow;
    }

    return text;
  }
}
