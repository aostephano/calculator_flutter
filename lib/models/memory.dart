class Memory {
  String _value = "0";

  //Getter
  String get value => _value;

  //Setter
  set value(String value) {
    _value = value;
  }

  //Methods
  void addCommand(command) {
    if (command == "AC") {
      allClear();
    } else {
      _value += command;
    }
  }

  void allClear() {
    _value = "0";
  }
}
