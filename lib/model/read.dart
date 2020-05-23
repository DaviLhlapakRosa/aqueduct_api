import 'package:simple_api/simple_api.dart';

class Read extends Serializable{

  String title;
  String author;
  int year;

  @override
  Map<String, dynamic> asMap() => {
    'title':title,
    'author':author,
    'year':year,
  };

  @override
  void readFromMap(Map<String, dynamic> object) {
    title = object["title"] as String;
    author = object["author"] as String;
    year = object["year"] as int;
  }
  
}