/// Enum that saves Gemini [ModelType].
enum ModelType {
  /// Gemini Flash model.
  geminiFlash(name: 'gemini-1.5-flash'),

  /// Gemini Pro model.
  geminiPro(name: 'gemini-1.5-pro'),

  /// Aqa model.
  aqa(name: 'aqa');

  /// Constructs an instance of Gemini [ModelType].
  const ModelType({required this.name});

  /// provides the default model.
  static ModelType get defaultModel => ModelType.geminiFlash;

  /// Generate [ModelType] from their name.
  static ModelType fromText(String value) {
    switch (value) {
      case 'gemini-1.5-flash':
        return ModelType.geminiFlash;
      case 'gemini-1.5-pro':
        return ModelType.geminiPro;
      case 'aqa':
        return ModelType.aqa;
      default:
        return ModelType.geminiFlash;
    }
  }

  /// Model type.
  final String name;
}
