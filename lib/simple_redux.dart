import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

//our model
class ListState {
  final List<String> items;

  ListState({this.items});

  ListState.initialState() : items = [];
}

//our actions
class AddAction {
  final String input;

  AddAction({this.input});
}

//reducer is what update the store based on the action.
ListState reducer(ListState state, action) {
  if (action is AddAction) {
    return ListState(
        items: []
          ..addAll(state.items)
          ..add(action.input));
  }
  return (ListState(items: state.items));
}

typedef AddItem(String text);

class _ViewModel {
  final AddItem addItemToList;

  _ViewModel({this.addItemToList});
}

class MySimpleApp extends StatelessWidget {
  final store =
      Store<ListState>(reducer, initialState: ListState.initialState());

  @override
  Widget build(BuildContext context) {
    return StoreProvider<ListState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: 'Redux List App',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Redux List"),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                ListInput(),
                ViewList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ListState, List<String>>(
      converter: (store) => store.state.items,
      builder: (context, items) => Column(
        children: items.map((i) => ListTile(title: Text(i))).toList(),
      ),
    );
  }
}

class ListInput extends StatefulWidget {
  @override
  _ListInputState createState() => _ListInputState();
}

class _ListInputState extends State<ListInput> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
// allow us to connect to the store with the entire of the application
    return StoreConnector<ListState, _ViewModel>(
//      convert the store to VM
      converter: (store) => _ViewModel(
        addItemToList: (inputText) => store.dispatch(
          AddAction(input: inputText),
        ),
      ),
      builder: (context, viewModel) {
        return TextField(
          controller: controller,
          onSubmitted: (text) {
            viewModel.addItemToList(text);
            controller.text = "";
          },
        );
      },
    );
  }
}
