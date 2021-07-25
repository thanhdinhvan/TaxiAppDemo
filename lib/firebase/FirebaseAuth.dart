import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  var _firabaseAuth = FirebaseAuth.instance;

// MARK: - đăng ký tài khoản
  void signUp(String name, String passWord, String email, String phone,
      Function() onSuccess, Function(String) onRegisterError) {
    _firabaseAuth
        .createUserWithEmailAndPassword(email: email, password: passWord)
        .then((value) {
      print(value);
      if (value.user == null) {
        return;
      }
      _createUser(value.user!.uid, name, phone, onSuccess, onRegisterError);
      onSuccess();
    }).catchError((err) {
      _onSignUpErr(err.toString(), onRegisterError);
    }).whenComplete(() => {print("")});
  }

// MARK: - Đăng nhập firebase
  void signIn(
      String email, String pass, Function onSuccess, Function(String) onError) {
    _firabaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) => {onSuccess()})
        .catchError((err) => {onError("Sign In fail")});
  }

  void _createUser(String userID, String name, String phone, Function onSuccess,
      Function(String) onRegisterError) {
    var user = {"name": name, "phone": phone};
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userID).set(user).then((value) => {onSuccess}).catchError((err) {
      // TODO
      onRegisterError("SignUp fail, please try again");
    }).whenComplete(() => {print("loi")});
  }

  void _onSignUpErr(String code, Function(String) onRegisterErr) {
    switch (code) {
      case "ERROR_INVALID_EMAIL":
        onRegisterErr("Invalid email");
        break;
      case "ERROR_INVALID_CREDENTIAL":
        onRegisterErr("Invalid email");
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        onRegisterErr("Email has exits");
        break;
      case "ERROR_WEAK_PASSWORD":
        onRegisterErr("The password is not strong enough");
        break;
      default:
        onRegisterErr("Signup fail, please try again");
        break;
    }
  }
}
