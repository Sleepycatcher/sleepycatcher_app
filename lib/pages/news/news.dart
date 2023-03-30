import 'package:flutter/material.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../model/Article.dart';
import '../../services/ArticleService.dart';
import 'dart:convert';

class NewsPage extends StatefulWidget {

  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    _loadArticles();
  }

  void _loadArticles() async {
    final articleService = ArticleService();
    final response = await articleService.getAllArticle();
    if (response != null && response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['articles'] != null) {
        final List<dynamic> jsonArticles = jsonData['articles'];
        List<Article> loadedArticles = jsonArticles
            .map((dynamic json) => Article.fromJson(json))
            .toList();
        setState(() {
          articles = loadedArticles;
          print(articles.length);
        });
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(article.source),
                Text(article.content),
              ],
            ),
          );
        },
      ),

    );
  }

  Widget _buildArticle(String title, String url, String description) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: Text('Lire l\'article'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
