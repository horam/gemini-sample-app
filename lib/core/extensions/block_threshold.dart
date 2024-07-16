import 'package:google_generative_ai/google_generative_ai.dart';

/// An extension on Google Generative ai enum [HarmBlockThreshold].
extension BlockThreshold on HarmBlockThreshold {
  /// Provides a list of available [HarmBlockThreshold] values.
  static List<HarmBlockThreshold> get values => HarmBlockThreshold.values;

  /// Provides the default threshold level in [HarmBlockThreshold].
  static String get defaultThresholdLevel =>
      label(HarmBlockThreshold.unspecified);

  /// Convert chosen text to the [HarmBlockThreshold] to be used in Gemini
  /// model.
  static HarmBlockThreshold fromText(String value) {
    switch (value) {
      case 'No settings for blocking content is defined.':
        return HarmBlockThreshold.unspecified;
      case 'Block content even with low probability of harm.':
        return HarmBlockThreshold.low;
      case 'Block content even with low and medium probability of harm.':
        return HarmBlockThreshold.medium;
      case 'Block content with low, medium and high probability of harm.':
        return HarmBlockThreshold.high;
      case 'show everything.':
        return HarmBlockThreshold.none;
      default:
        return HarmBlockThreshold.unspecified;
    }
  }

  /// Provides a label value from [HarmCategory] to be shown in the app.
  static String label(HarmBlockThreshold blockThreshold) {
    switch (blockThreshold) {
      case HarmBlockThreshold.unspecified:
        return 'No settings for blocking content is defined.';
      case HarmBlockThreshold.low:
        return 'Block content even with low probability of harm.';
      case HarmBlockThreshold.medium:
        return 'Block content even with low and medium probability of harm.';
      case HarmBlockThreshold.high:
        return 'Block content with low, medium and high probability of harm.';
      case HarmBlockThreshold.none:
        return 'show everything.';
      default:
        return 'No settings for blocking content is defined.';
    }
  }
}
