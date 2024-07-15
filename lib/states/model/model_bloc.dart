import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/states/model/model.dart';

/// A class the wraps the related logic to ai model.
class ModelBloc extends Bloc<ModelEvent, ModelState> {
  /// Creates an instance of [ModelBloc].
  ModelBloc(super.initialState) {
    on<SwitchModelEvent>(_onSwitchModelEvent);
  }

  Future<void> _onSwitchModelEvent(
    SwitchModelEvent event,
    Emitter<ModelState> emit,
  ) async {
    emit(state.copyWith(selectedModel: event.modelType));
  }
}
