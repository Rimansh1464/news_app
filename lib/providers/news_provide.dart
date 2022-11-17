import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helper/api_helper.dart';
import '../models/news_models.dart';

class NewsProvider extends ChangeNotifier{
  Future<List<Articles>?>? newsList ;

  newsApi(){
    newsList = NewsApiHelper.newsApiHelper.fetchData(category: "health");
    notifyListeners();

  }
  allDataApi(){
    newsList = NewsApiHelper.newsApiHelper.fetchAllData();
    notifyListeners();

  }

  updateApi({required category }){
    newsList = NewsApiHelper.newsApiHelper.fetchData(category: category);
    notifyListeners();
  }
  launchURLBrowser({required  uri}) async {
    var url = Uri.parse("$uri");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<void> LlaunchURLBrowser() async {
    Uri url = Uri.parse("https://flutter.dev");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url') ;
    }
  }

}