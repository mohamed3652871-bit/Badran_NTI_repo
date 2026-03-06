
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
var dio = Dio( BaseOptions(
    baseUrl: 'https://ntitodo-production-779a.up.railway.app/api/'
));

class Task{
  String? createdAt ;
  String? description;
  int? id;
  String? imagePath;
  String? title;

  Task({this.createdAt, this.description, this.id, this.imagePath, this.title});
Task.fromJson(Map<String,dynamic> json){
  createdAt = json['created_at'];
  description =json['description'];
  id = json['id'];
  title = json['title'];

  Map<String,dynamic> toJson() {
  return{
    "created_at": createdAt,
    "description": description,
    "id": id,
    "title": title

  };
  }
}
}



class Book {
  late String name;
  String? author;
  late double price;
  String? category;

  Book({ required this.name, this.author, this.price =0, this.category});
  Book.catA({ required this.name, this.author}){
    price = 100;
    category = "A";

  }
  Book.fromJson(Map<String, dynamic> json){
    name = json['name'] ?? "Unknown";
    author = json['author'];
    price = double.tryParse(json['price'].toString()) ?? 0;
    category = json['category'];
  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'author': author,
      'price': price,
      'category': category
    };
  }
  void display(){
    print("Name: $name");
    print("Author: ${author ?? "Unknown"}");
    print("Price: $price");
    print("Category: ${category ?? "Unknown"}");
  }
}


void main()async{
  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    final client = HttpClient();
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };



  // Book b1 = Book.catA( name: 'book 1' );
  // Book b2 = Book.catA(name: 'book 2');
  // b2 = b1;
  // b1.name = "book 3";
  // b2.name = "book 4";
  // print(b1 == b2);
  // print(b1.name );
  // print(b2.name );


  var bookMap = {
    "name": "book 1",
    "author": "author 1",
    "price": 100.0,
    "category": "A"
  };
// Book b4 = Book(name: bookMap['name'], author: bookMap['author'], price: bookMap['price'], category: bookMap['category']);

// Map<String, dynamic> bookJson ={
//   'name': b4.name,
//   'author': b4.author,
//   'price': b4.price,
//   'category': b4.category
// };
  Book b3 = Book.fromJson(bookMap);
  b3.display();


  // b1.display();
  // b2.display();
}