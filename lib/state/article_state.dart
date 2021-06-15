import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/article_model.dart';
import '../routes/app_route.dart';
import '../services/error_service.dart';

class ArticleState extends GetxController {
  List<ArticleModel> _articles;

  List<ArticleModel> get articles => _articles;

  Future<void> getArticles() async {
    try {
      var response = await http.get(
        Uri.parse(AppRoute.api + 'get_news.php'),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<ArticleModel> articles = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((article) {
          articles.add(
            ArticleModel.fromJSON(article),
          );
        });
        _articles = articles;
      } else {
        _articles = [];
      }
    } catch (e) {
      showError(e);
      _articles = [];
    } finally {
      update();
    }
  }
}
