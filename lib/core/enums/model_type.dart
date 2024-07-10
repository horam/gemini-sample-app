enum ModelType {
  geminiFlash(name: 'gemini-1.5-flash'),

  geminiPro(name: 'gemini-1.5-pro'),

  textEmbedding(name: 'text-embedding-004'),

  aqa(name: 'aqa');

  static String get defaultModel => ModelType.geminiFlash.name;

  const ModelType({required this.name});

  final String name;
}
