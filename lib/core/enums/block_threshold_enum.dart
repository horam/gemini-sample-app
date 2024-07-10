enum BlockThreshold {
  /// Threshold is unspecified, block using default threshold.
  unspecified(label: 'No settings for blocking content is defined.'),

  /// Block when medium or high probability of unsafe content.
  low(label: 'Block content even with low probability of harm.'),

  /// Block when medium or high probability of unsafe content.
  medium(label: 'Block content even with medium probability of harm.'),

  /// Block when high probability of unsafe content.
  high(label: 'Block content with high probability of harm.'),

  /// Always show regardless of probability of unsafe content.
  none(label: "show everything.");

  static String get defaultThresholdLevel => BlockThreshold.unspecified.label;

  final String label;

  const BlockThreshold({required this.label});
}
