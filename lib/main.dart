import 'package:flutter/material.dart';
import 'package:flutter_redux_pattern/long_ex.dart';

//reducer is what update the store based on the action.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyLongExApp();
  }
}
