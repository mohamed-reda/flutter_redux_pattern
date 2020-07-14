class SetExampleDataAction {
  final String name;
  final String surname;
  final bool hasAccount;

  SetExampleDataAction({this.name, this.surname, this.hasAccount});

  @override
  String toString() {
    // TODO: implement toString
    return '$name $surname, account: $hasAccount';
  }
}

class ClearExampleDataAction {}

class MiddlewareExampleCompleteAction {}
