import 'dart:convert';

// List<News> animalJson(String str) =>
//     List<News>.from(json.decode(str).map((x) => News.fromMap(data: x)));
//
// class News {
//   String? name;
//   String? title;
//   String? description;
//   String? image;
//   String? date;
//   String? content;
//
//   News({
//     required this.name,
//     required this.title,
//     required this.description,
//     required this.date,
//     required this.content,
//     required this.image,
//   });
//
//   factory News.fromMap({required Map data}) {
//     return News(
//       name: data["articles"]["source"]["name"],
//       title: data["articles"]["title"]?? "null",
//       description: data["articles"]["description"] ?? "null",
//       date: data["articles"]["publishedAt"] ?? "null",
//       content: data["articles"]["content"] ?? "null",
//       image: data["articles"]["urlToImage"] ?? "null",
//     );
//   }
//
//   // factory News.database({required Map data}) {
//   //   return News(
//   //     name: data["name"],
//   //     image: data["image"],
//   //     topSpeed: data["top_speed"],
//   //     skinType: data["skin_type"],
//   //     color: data["color"],
//   //     length: data["length"],
//   //     weight: data["weight"],
//   //   );
//   // }
// }

// To parse this JSON data, do
//
//     final newsData = newsDataFromJson(jsonString);

// To parse this JSON data, do
//
//     final newsData = newsDataFromJson(jsonString);

import 'dart:convert';
 NewsData NewsFromJson(String str) => NewsData.fromJson(json.decode(str));

String NewsToJson(NewsData data) => json.encode(data.toJson());



class NewsData {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsData({this.status, this.totalResults, this.articles});

  NewsData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
