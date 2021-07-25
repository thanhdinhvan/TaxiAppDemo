import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

import 'package:taxiappdemo/firebase/FirebaseAuth.dart';

class LogInBloc {
  var _firAuth = FireAuth();

  StreamController _nameController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get passStream => _passController.stream;

  LogInBloc() {}
  void dispose() {
    _nameController.close();
    _passController.close();
  }

  bool isValid(String name, String pass) {
    if (name == null || name.length == 0) {
      _nameController.sink.addError("Nhập tên");
      return false;
    }
    _nameController.sink.add("");
    if (pass == null || pass.length < 6) {
      _passController.sink.addError("Mật khẩu phải trên 5 kí tự");
      return false;
    }
    _passController.sink.add("");
    return true;
  }

  void onSignIn(
      String name, String pass, Function onSuccess, Function(String) onError) {
    _firAuth.signIn(name, pass, (value) => {print(value), onSuccess()},
        (err) => {onError(err)});
  }
}
