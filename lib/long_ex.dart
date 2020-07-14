import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

import './redux/app_state.dart';
import './redux/middleware.dart';
import './redux/reducers.dart';
import './ui/views/example_view.dart';

class MyLongExApp extends StatelessWidget {
  final DevToolsStore<AppState> store = DevToolsStore<AppState>(appStateReducer,
      initialState: AppState.initialState(),
      middleware: createAppStateMiddleware());

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Redux arch',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StoreBuilder<AppState>(
            builder: (BuildContext context, Store<AppState> store) => Scaffold(
                endDrawer: Container(
                    width: MediaQuery.of(context).size.width * .9,
                    color: Colors.white,
                    child: ReduxDevTools<AppState>(store)),
                body: ExampleView())),
      ),
    );
  }
}
