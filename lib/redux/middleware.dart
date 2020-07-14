import 'package:redux/redux.dart';

import '../redux/actions/example_actions.dart';
import '../redux/app_state.dart';

List<Middleware<AppState>> createAppStateMiddleware() {
  return [
    TypedMiddleware<AppState, SetExampleDataAction>(_exampleMiddleAction()),
    _logAllActions()
  ];
}

Middleware<AppState> _exampleMiddleAction() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    await Future.delayed(Duration(seconds: 1));

    next(MiddlewareExampleCompleteAction());
  };
}

Middleware<AppState> _logAllActions() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    print('${action.runtimeType} : ${action.toString()}');
  };
}
