import 'package:dio/dio.dart';
import 'package:news/models/news_model.dart';

class NewsRepo {
  final Dio dio = Dio();

  Future<List<ArticleModel>> fetchNews() async{
    final res = await dio.get('https://newsapi.org/v2/everything?q=apple&from=2023-10-21&to=2023-10-21&sortBy=popularity&apiKey=95d39f5147a247b2851094bfdfa24cd2');

    final articleModel = NewsModel.fromJson(res.data);
    final article = articleModel.articles;
    return article;
  }
}
