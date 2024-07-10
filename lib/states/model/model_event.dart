import 'package:equatable/equatable.dart';
import 'package:gemini_app/core/enums/enums.dart';

class ModelEvent extends Equatable {
  const ModelEvent();
  @override
  List<Object?> get props => [];
}

class SwitchModelEvent extends ModelEvent {
  /// Gemini model type.
  final ModelType modelType;

  /// Switches to a new model.
  const SwitchModelEvent({required this.modelType});

  @override
  List<Object> get props => [modelType];
}
