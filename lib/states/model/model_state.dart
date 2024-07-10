import 'package:equatable/equatable.dart';
import 'package:gemini_app/core/enums/enums.dart';

class ModelState extends Equatable {
  final ModelType selectedModel;

  const ModelState({required this.selectedModel});

  @override
  List<Object> get props => [selectedModel];

  ModelState copyWith({ModelType? selectedModel}) {
    return ModelState(selectedModel: selectedModel ?? this.selectedModel);
  }
}
