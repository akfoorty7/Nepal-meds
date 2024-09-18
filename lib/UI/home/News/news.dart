import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String _apiKey = '7ca93cd208ef47de985d13289b6f0f68';
  final String _baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchNews() async {
    final response = await http.get(Uri.parse('$_baseUrl/top-headlines?language=en&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> articlesJson = json['articles'];
      List<Article> articles = articlesJson.map((json) => Article.fromJson(json)).toList();
      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }
}

class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
    );
  }
}