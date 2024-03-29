import 'package:http/http.dart' as http;
import 'package:wallpaper/Dashboard/NewsA/models/article.dart';
import 'dart:convert';
import 'package:wallpaper/Dashboard/NewsA/secret.dart';

class News {

  List<Article> news  = [];

  Future<void> getNews() async{

    String url =
"https://newsapi.org/v2/top-headlines?country=in&category=Health&apiKey=4a4d2dbf973841c99975594e64acad76";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }


  }


}




