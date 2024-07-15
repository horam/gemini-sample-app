import 'package:google_generative_ai/google_generative_ai.dart';

/// An extension to extend the default functionality  of [HarmCategory]
/// in 'google_generative_ai' package.
extension HarmType on HarmCategory {
  // unspecifiedType: unspecified.
  // harassment:  Malicious, intimidating, bullying, or abusive comments
  // targeting another individual.
  // hateSpeech:   Negative or harmful comments targeting identity and/or
  //protected attributes.
  // sexuallyExplicit: Contains references to sexual acts or other lewd content.
  // dangerousContent: Promotes or enables access to harmful goods, services,
  // and activities.

  /// Provides a list of available [HarmCategory] values.
  static List<HarmCategory> get values => HarmCategory.values;

  /// Harm category default value.
  static String get defaultCategory => label(HarmCategory.unspecified);

  /// Convert chosen text to the [HarmCategory] to be used in Gemini.
  static HarmCategory fromText(String value) {
    switch (value) {
      case 'No harm Type is selected.':
        return HarmCategory.unspecified;
      case 'harassment':
        return HarmCategory.harassment;
      case 'hateSpeech':
        return HarmCategory.hateSpeech;
      case 'Contains references to sexual acts.':
        return HarmCategory.sexuallyExplicit;
      case 'Promotes or enables access to harmful activities.':
        return HarmCategory.dangerousContent;
      default:
        return HarmCategory.harassment;
    }
  }

  /// Provides a label value from [HarmCategory] to be shown in the app.
  static String label(HarmCategory category) {
    switch (category) {
      case HarmCategory.unspecified:
        return 'No harm Type is selected.';
      case HarmCategory.harassment:
        return 'harassment';
      case HarmCategory.hateSpeech:
        return 'Hate speech';
      case HarmCategory.sexuallyExplicit:
        return 'Contains references to sexual acts.';
      case HarmCategory.dangerousContent:
        return 'Promotes or enables access to harmful activities.';
      default:
        return 'harassment';
    }
  }
}
