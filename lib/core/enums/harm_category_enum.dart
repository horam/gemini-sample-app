enum HarmCategoryEnum {
  unspecified(label: 'No harm Category is selected.'),

  /// Malicious, intimidating, bullying, or abusive comments targeting another
  /// individual.
  harassment(label: 'harassment'),

  /// Negative or harmful comments targeting identity and/or protected
  /// attributes.
  hateSpeech(label: 'hateSpeech'),

  /// Contains references to sexual acts or other lewd content.
  sexuallyExplicit(label: 'sexuallyExplicit'),

  /// Promotes or enables access to harmful goods, services, and activities.
  dangerousContent(label: 'dangerous Content');

  /// Harm category default value.
  static String get defaultCategory => HarmCategoryEnum.unspecified.label;

  ///  Harm Category label to show to the user.
  final String label;

  /// Constructs ths harm category enum.
  const HarmCategoryEnum({required this.label});
}
