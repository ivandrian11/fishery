import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/app_route.dart';
import '../model/user_model.dart';

class UserState extends GetxController {
  UserModel _user;

  UserModel get user => _user;

  Future<void> savePref(UserModel user) async {
    final pref = await SharedPreferences.getInstance();

    final myData = json.encode(
      {'id': user.id, 'email': user.email, 'password': user.password},
    );

    pref.setString('authData', myData);
    _user = user;
    update();
  }

  Future<bool> getPref() async {
    final pref = await SharedPreferences.getInstance();

    if (!pref.containsKey('authData')) {
      return false;
    }
    _user = UserModel.fromJSON(jsonDecode(pref.get('authData')));
    update();
    return true;
  }

  Future<UserModel> register(String email, String password) async {
    final body = {'email': email, 'password': password};

    try {
      final response = await http.post(
        Uri.parse(AppRoute.api + 'register.php'),
        body: body,
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return UserModel.fromJSON(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel> login(String email, String password) async {
    final body = {'email': email, 'password': password};

    try {
      final response = await http.post(
        Uri.parse(AppRoute.api + 'login.php'),
        body: body,
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return UserModel.fromJSON(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> logOut() async {
    final pref = await SharedPreferences.getInstance();

    pref.clear();
    _user = null;
  }
}
