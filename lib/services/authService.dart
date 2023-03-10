import 'package:http/http.dart' as http;

import '../model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  Future<http.Response?> login(User user) async {
    try {
      var url = Uri.parse("https://sleepycatcherapi.hop.sh/api/auth/login?API_KEY=sf4g2f6sdf45s4df65s4d65fsdc21c31x2c3");
      var response = await http.post(url, body: {
        "email": user.email,
        "password": user.password,
        "username": user.username,
      });
      if (response.statusCode == 200) {
        print(response.body);
        await saveJWT(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}. ');
      }
      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<http.Response?> register(User user) async {
    try {
      var url = Uri.parse("https://sleepycatcherapi.hop.sh/api/auth/register?API_KEY=sf4g2f6sdf45s4df65s4d65fsdc21c31x2c3");
      var response = await http.post(url, body: {
        "email": user.email,
        "password": user.password,
        "username": user.username,
      });
      if (response.statusCode == 201) {
        print(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}. ');
      }
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> saveJWT(String jwt) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', jwt);
  }

  Future<String?> getJWT() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt');
  }

  Future<http.Response?> checkJWT(User user) async {
    try {
      var url = Uri.parse("https://sleepycatcherapi.hop.sh/api/api/auth");
      String? jwt = await getJWT(); //
      var response = await http.get(
        url,
        headers: {"Authorization": "Bearer $jwt"},
      );
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('Connexion non valide');
      }
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }


}
