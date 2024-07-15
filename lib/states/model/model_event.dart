import 'package:equatable/equatable.dart';
import 'package:gemini_app/core/enums/enums.dart';

/// Base class for model events.
class ModelEvent extends Equatable {
  /// Constructs an instance of [ModelEvent]
  const ModelEvent();
  @override
  List<Object?> get props => [];
}

/// Switches to a new model.
class SwitchModelEvent extends ModelEvent {
  /// Constructs an instance of [SwitchModelEvent]
  const SwitchModelEvent({required this.modelType});

  /// Gemini model type.
  final ModelType modelType;

  @override
  List<Object> get props => [modelType];
}
