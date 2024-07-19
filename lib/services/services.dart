import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/category_model.dart';

class NewsApi {
  // for news home
  List<NewsModel> dataStore = [];

  Future<void> getNews() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=32938c0bff8c4092bbd83655e9ef1391");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData["status"] == "ok") {
          jsonData["articles"].forEach((element) {
            if (element['urlToImage'] != null &&
                element['description'] != null &&
                element['author'] != null &&
                element['content'] != null &&
                element['title'] != null) {
              // Check for title as well
              NewsModel newsModel = NewsModel(
                title: element['title'],
                urlToImage: element['urlToImage'],
                description: element['description'],
                author: element['author'],
                content: element['content'],
              );
              dataStore.add(newsModel);
            }
          });
        } else {
          print("Error: API status is not OK");
        }
      } else {
        print("Error: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

// For display news of category items
class CategoryNews {
  // for news home
  List<NewsModel> dataStore = [];

  Future<void> getNews(String category) async {
    Uri url = Uri.parse(
        // "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=32938c0bff8c4092bbd83655e9ef1391");
        // "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=32938c0bff8c4092bbd83655e9ef1391");
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=32938c0bff8c4092bbd83655e9ef1391");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData["status"] == "ok") {
          jsonData["articles"].forEach((element) {
            if (element['urlToImage'] != null &&
                element['description'] != null &&
                element['author'] != null &&
                element['content'] != null &&
                element['title'] != null) {
              // Check for title as well
              NewsModel newsModel = NewsModel(
                title: element['title'],
                urlToImage: element['urlToImage'],
                description: element['description'],
                author: element['author'],
                content: element['content'],
              );
              dataStore.add(newsModel);
            }
          });
        } else {
          print("Error: API status is not OK");
        }
      } else {
        print("Error: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
