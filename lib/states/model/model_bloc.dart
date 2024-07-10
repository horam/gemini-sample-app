import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/states/model/model.dart';

class ModelBloc extends Bloc<ModelEvent, ModelState> {
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
