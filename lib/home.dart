// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newstime/Models/category_data.dart';
import 'package:newstime/Models/category_model.dart';
import 'package:newstime/services/category_news.dart';
import 'package:newstime/services/news_details.dart';
import 'package:newstime/services/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NewsModel> articles = [];
  List<CategoryModel> categories = [];
  bool isLoadin = true;

  @override
  void initState() {
    // getcategories

    categories = getCategories();
    getNews();
    super.initState();
  }

  getNews() async {
    NewsApi newsApi = NewsApi();
    await newsApi.getNews();
    setState(() {
      articles = newsApi.dataStore;
      isLoadin = false;
    });
    print(articles);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text("Flutter"),
            Text(
              "NewsTime",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: isLoadin
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  //! for category selection
                  Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      // physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length, // Added itemCount
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return GestureDetector(
                            onTap: () {
                              // now category clickable and show the realted file
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectedCategoryNews(
                                          category: category.categoryName!,
                                        )),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue,
                                ),
                                child: Text(
                                  category.categoryName!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                  ),

                  //! for home screen news
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: articles.length, // Added itemCount
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return GestureDetector(
                        onTap: () {
                          // ! Display the detail of category
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NewsDetail(newsModel: article),
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
                  )
                ],
              ),
            ),
    );
  }
}

// ! display the list of category items

