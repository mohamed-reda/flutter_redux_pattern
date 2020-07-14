import '../models/example.dart';
import '../redux/actions/example_actions.dart';
import '../redux/app_state.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(example: exampleReducer(state.example, action));
}

Example exampleReducer(Example state, action) {
  if (action is SetExampleDataAction) {
    return Example(
        name: action.name,
        surname: action.surname,
        hasAccount: action.hasAccount);
  }

  if (action is ClearExampleDataAction) {
    return Example.initialState();
  }

  return state;
}
