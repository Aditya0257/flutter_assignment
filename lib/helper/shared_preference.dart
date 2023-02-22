
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

class SPController {
  setUserName(value) {
    prefs.setString('user_name', value);
  }

  getUserName() {
    return prefs.getString('user_name');
  }

  setUserImage(value){
    prefs.setString('user_image', value);
  }

  getUserImage(){
    return prefs.getString('user_image');
  }

  setIsLoggedin(value) {
    prefs.setBool('is_login', value);
  }

  getIsLoggedin() {
    var value = prefs.getBool('is_login');
    if (value == null) {
      return false;
    }
    return value;
  }
}
