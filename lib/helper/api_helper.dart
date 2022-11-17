import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/models/news_models.dart';

final Dio _dio = Dio();

class NewsApiHelper {
  NewsApiHelper._();

  static NewsApiHelper newsApiHelper = NewsApiHelper._();


  Future<List<Articles>?> fetchData({required category}) async {
    try {
      var res = await _dio.get(
          "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=d7847cc382724e728fa47b9f9f03e5b0");

      if (res.statusCode == 200) {
        NewsData data = NewsFromJson(jsonEncode(res.data));

        List<Articles>? allNews = data.articles;

        print("object ==> ${allNews?.length}");
        print("1 ==> ${allNews?[1].source?.name}");
        return allNews;
      } else {
        print(res.statusCode);
      }
    } on DioError catch (e) {
    } catch (e) {
      log("error: $e");
    }
  }
  Future<List<Articles>?> fetchAllData() async {
    try {
      var res = await _dio.get(
          "https://newsapi.org/v2/top-headlines?country=in&apiKey=d7847cc382724e728fa47b9f9f03e5b0");

      if (res.statusCode == 200) {
        NewsData data = NewsFromJson(jsonEncode(res.data));

        List<Articles>? allNews = data.articles;

        print("object ==> ${allNews?.length}");
        print("1 ==> ${allNews?[1].source?.name}");
        return allNews;
      } else {
        print(res.statusCode);
      }
    } on DioError catch (e) {
    } catch (e) {
      log("error: $e");
    }
    return null;
  }
}
