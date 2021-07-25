import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

import 'package:taxiappdemo/firebase/FirebaseAuth.dart';

class RegisterBloc {
  var _firAuth = FireAuth();

  StreamController _nameController = new StreamController();

  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();
  StreamController _phoneController = new StreamController();

  StreamController _authController = new StreamController();

  Stream get authResults => _authController.stream;
  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;
  Stream get phoneStream => _phoneController.stream;

  RegisterBloc() {}
  void dispose() {
    _authController.close();
    _nameController.close();
    _emailController.close();
    _phoneController.close();
    _passController.close();
  }

  bool isValid(String name, String pass, String email, String phone) {
    if (name == null || name.length == 0) {
      _nameController.sink.addError("Nhập tên");
      return false;
    }
    _nameController.sink.add("a");

    if (phone == null || phone.length == 0) {
      _phoneController.sink.addError("Nhập số điện thoại!");
      return false;
    }
    _phoneController.sink.add("");

    if (email == null || email.length == 0) {
      _emailController.sink.addError("Nhập Email");
      return false;
    }
    _emailController.sink.add("");

    if (pass == null || pass.length < 6) {
      _passController.sink.addError("Mật khẩu phải trên 5 kí tự");
      return false;
    }
    _passController.sink.add("");
    return true;
  }

  void singUp(String name, String pass, String email, String phone,
      Function() onSuccess, Function(String) onError) {
    _firAuth.signUp(name, pass, email, phone, onSuccess, onError);
  }
}
