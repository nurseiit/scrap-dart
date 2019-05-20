import 'dart:io';

import 'package:scrap_dart/scrap_dart.dart' as scrap_dart;

void main(List<String> arguments) async {
  print('Initiating the app...');
  
  var result = await scrap_dart.initiate();
  var filename = 'news.json';
  
  print('Saving to `$filename`...');
  
  await File(filename).writeAsString(result);
  print('Done!');
  return;
}
