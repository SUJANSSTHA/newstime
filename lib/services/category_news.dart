import 'package:flutter/material.dart';
import 'package:newstime/Models/category_model.dart';
import 'package:newstime/services/news_details.dart';
import 'package:newstime/services/services.dart';

class SelectedCategoryNews extends StatefulWidget {
  String category;
  SelectedCategoryNews({super.key, required this.category});

  @override
  State<SelectedCategoryNews> createState() => _SelectedCategoryNewsState();
}

class _SelectedCategoryNewsState extends State<SelectedCategoryNews> {
  List<NewsModel> articles = [];
  bool isLoadin = true;
  getNews() async {
    CategoryNews news = CategoryNews();
    await news.getNews(widget.category);
    articles = news.dataStore;
    setState(() {
      isLoadin = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(
          widget.category,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: isLoadin
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: articles.length, // Added itemCount
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetail(newsModel: article),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          article.urlToImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    article.urlToImage!,
                                    height: 250,
                                    width: 400,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const SizedBox(
                                  height: 10.0,
                                ),
                          Text(
                            article.title ?? 'No Title',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
