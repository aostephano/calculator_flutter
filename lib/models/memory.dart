class Memory {
  static const operations = const ['%', '/', 'x', '-', '+', '='];
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? _operation;
  String _value = '0';
  bool _wipeValue = false; //Should wipe the value on display?
  String _lastOperator = '';

  //Getter
  String get value => _value;

  //Setter
  set value(String value) {
    _value = value;
  }

  //Methods
  void addCommand(command) {
    //If the user use another command, the actual operation are replaced
    if (_isReplacingOperation(command)) {
      _operation = command;
      return;
    }
    if (command == "AC") {
      _allClear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }

    _lastOperator = command;
  }

  _isReplacingOperation(String command) {
    return operations.contains(_lastOperator) &&
        operations.contains(command) &&
        _lastOperator != "=" &&
        command != "=";
  }

  _addDigit(String digit) {
    final isDot = digit == '.'; //return false or true
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    if (isDot && _value.contains(".") && !wipeValue) {
      return;
    }

    final emptyValue = isDot ? '0' : '';

    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    //?? operator means "if null"
    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;

    print(
        "Operation :${_operation}, First Value: ${_buffer[0]} Second Value: ${_buffer[1]}");
  }

  _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';
    if (_bufferIndex == 0) {
      //Only clean the buffer display if isnt a "=" Equal Operator
      if (!isEqualSign) {
        _operation = newOperation;
        _bufferIndex = 1;
        _wipeValue = true;
      }
    } else {
      _buffer[0] =
          _calculate(); //Atributte the result in the first buffer, and clear the next one to be used
      _buffer[1] = 0.0;
      _value = _buffer[0].toString();
      _value = _value.endsWith(".0") ? _value.split('.')[0] : _value;

      _operation = isEqualSign ? null : newOperation;
      //_bufferIndex set to 0 = U dont want new Operations
      // _bufferIndex set to 1 = U and to add more Operations
      _bufferIndex = isEqualSign ? 0 : 1;
    }
    _wipeValue = true;
  }

  //AC
  void _allClear() {
    _value = "0";
    //Clear both buffers
    _buffer[0] = 0.0;
    _buffer[1] = 0.0;
    _operation = null;
    //Reset buffer
    _bufferIndex = 0;
    _wipeValue = false;
  }

  double _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }
}
