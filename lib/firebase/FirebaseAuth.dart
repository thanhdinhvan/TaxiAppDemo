import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth{
    var _firabaseAuth = FirebaseAuth.instance;

    void signUp(String email, String passWord, String name, String phone){
      _firabaseAuth.createUserWithEmailAndPassword(email: email, password: passWord).then((value) {
        print(value);
        if (value.user == null){return;}
    _createUser(value.user!.uid, name, phone);
      }).catchError((err) {
        print(err);
      }); 
    }

    _createUser(String userID, String name, String phone){
      var user = {
          "name" : name,
          "phone" : phone
      };

      var ref = FirebaseDatabase.instance.reference().child("users");
      ref.child("userID").set(user).then((value) => {
        //success

      }).catchError((err){
        // TODO
      });
    }

}