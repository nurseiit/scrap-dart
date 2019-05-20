import 'dart:io'; // stdout.write
import 'dart:convert'; // JSON

import 'package:http/http.dart'; // API Calls
import 'package:html/parser.dart'; // HTML Parsers
import 'package:html/dom.dart'; // DOM

Future<dynamic> initiate() async {
  const baseurl = "https://azattyq.org";
  
  stdout.write('Scraping { $baseurl }');

  var client = Client();

  stdout.write('.');
  Response response = await client.get('$baseurl/z/330');

  stdout.write('.');
  var document = parse(response.body);
  var newsSection = document.querySelector('div.media-block-wrap');
  List<Element> allnews = newsSection.querySelectorAll('div.content');

  List<Map<String, dynamic>> newsMap = [];
  
  for (var news in allnews) {
    var date = news.querySelector('.date');
    var title = news.querySelector('span.title');
    var link = news.querySelector('a')?.attributes['href'];

    newsMap.add({
      'date': date?.text,
      'title': title?.text,
      'link': baseurl + link
    });
  }
  stdout.write('.\n');
  return json.encode(newsMap);
}
