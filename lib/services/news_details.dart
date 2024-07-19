import 'package:flutter/material.dart';
import 'package:newstime/Models/category_model.dart';

class NewsDetail extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetail({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              newsModel.title ?? 'No Title',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                    child: Text(
                  "- ${newsModel.author ?? 'Unknown'}",
                ))
              ],
            ),
            const SizedBox(height: 10),
            newsModel.urlToImage != null
                ? Image.network(newsModel.urlToImage!)
                : SizedBox(),
            const SizedBox(height: 10),
            Text(
              newsModel.content ?? 'No Content',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              newsModel.description ?? 'No Description',
              style: const TextStyle(
                fontSize: 18,
              ),
              maxLines: null,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
