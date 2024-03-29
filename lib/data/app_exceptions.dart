class AppExeption implements Exception {
  final _message;
  final _prefix;
  AppExeption(this._message, this._prefix);

  @override
  String toString() {
    return '$_message  $_prefix';
  }
}

class FetchDataExeption extends AppExeption {
  FetchDataExeption([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestExeption extends AppExeption {
  BadRequestExeption([String? message])
      : super(message, 'Invalid Request');
}


class UnAuthException extends AppExeption {
  UnAuthException([String? message])
      : super(message, 'UnAuthorized Request');
}

class InvalidInputExcption extends AppExeption {
  InvalidInputExcption([String? message])
      : super(message, 'Invalid Input');
}

