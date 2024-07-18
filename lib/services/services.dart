import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/category_model.dart';

class NewsApi {
  List<NewsModel> dataStore = [];
  Future<void> getNews() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=32938c0bff8c4092bbd83655e9ef1391");
    var response = await http.get(url);
    // String JsonData = jsonDecode(response.body);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['content'] != null) {
          NewsModel newsModel = NewsModel(
            title: element['title'],
            urlToImage: element['urlToImage'],
            author: element['description'],
            content: element['content'],
          );
          dataStore.add(newsModel);
        }
      });
    }
  }
}
