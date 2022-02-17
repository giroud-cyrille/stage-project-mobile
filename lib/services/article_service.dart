import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_app/models/article.dart';
import 'package:mobile_app/utils/utils.dart';

class ArticleService {
  static Future<dynamic> getArticles(title) async {
    var articles = [];

    try {
      final response =
          await http.get(Uri.parse('$uriApi/articles.php?title=$title'));

      if (response.statusCode == 200) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));

        if (json.length > 0) {
          for (var articleJson in json) {
            articles.add(Article.fromJson(articleJson));
          }
        }
      }
    } catch (exception) {
      return articles;
    }
    return articles;
  }

  static Future<dynamic> updateUser(id_article, body) async {
    try {
      final response =
      await http.put(Uri.parse('$uriApi/put.php?id_article=$id_article'), body: body);

      if (response.statusCode != 200) {
        return false;
      }
    } catch (identifier) {
      return false;
    }
    return true;
  }

  static Future<bool> createArticle(
      title, resume, text, published, update, idUser) async {
    try {
      final response =
          await http.post(Uri.parse('$uriApi/postArticle.php'), body: {
        "title": "$title",
        "resume": "$resume",
        "text": "$text",
        "published": "$published",
        "update": "$update",
        "idUser": "$idUser"
      });

      if (response.statusCode != 200) {
        return false;
      }
    } catch (e) {
      return false;
    }

    return true;
  }
}
