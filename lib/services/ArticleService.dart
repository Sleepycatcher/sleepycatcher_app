import 'package:http/http.dart' as http;

import '../model/Article.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleService {
  Future<http.Response?> getAllArticle() async {
    try {
      var url = Uri.parse("https://sleepycatcherapi.hop.sh/api/articles?API_KEY=sf4g2f6sdf45s4df65s4d65fsdc21c31x2c3");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}. ');
      }
      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }



}
