import 'package:shared_preferences/shared_preferences.dart';

enum KeyUser { userID, userName, emailUser }

class Userdefault {
  static var share = new Userdefault();

  void setAuth(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(KeyUser.userID.toString(), userId);
  }

  Future<bool> getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getString(KeyUser.userID.toString());
    if (result != null) {
      return true;
    }
    return false;
  }
}
