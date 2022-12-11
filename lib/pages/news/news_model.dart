import 'dart:convert';
import 'package:http/http.dart' as http;

class News {
  String? sourceName, author, title, desc, url, urlImage, publishAt, content;

  News({
    this.sourceName,
    this.author,
    this.title,
    this.desc,
    this.url,
    this.urlImage,
    this.publishAt,
    this.content,
  });
}

Future<List<News>> getRequest() async {
  //replace your restFull API here.
  String url =
      "https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=028e70b349484a649171195ca796b7ba";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body)['articles'];

  //Creating a list to store input data;
  List<News> datas = [];
  for (var news in responseData) {
    News data = News(
      sourceName: news['source']['name'],
      title: news['title'],
      author: news['author'],
      desc: news['description'],
      url: news['url'],
      urlImage: news['urlToImage'],
      publishAt: news['publishedAt'],
      content: news['content'],
    );

    //Adding user to the list.
    datas.add(data);
  }
  return datas;
}
