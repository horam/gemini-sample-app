import 'package:equatable/equatable.dart';
import 'package:gemini_app/core/enums/enums.dart';

/// A class to keeps the state of user's chosen model.
class ModelState extends Equatable {
  /// Constructs an instance of the model state.
  const ModelState({required this.selectedModel});

  /// The user's selected model.
  final ModelType selectedModel;

  @override
  List<Object> get props => [selectedModel];

  /// Copy the current.
  ModelState copyWith({ModelType? selectedModel}) =>
      ModelState(selectedModel: selectedModel ?? this.selectedModel);
}
