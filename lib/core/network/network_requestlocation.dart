import 'dart:convert';
import 'package:exam/core/model/account.dart';
import 'package:exam/core/model/post.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  // static const String url = 'https://jsonplaceholder.typicode.com/photos';
  // static const String url = 'https://fakestoreapi.com/products';

  static List<Post> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
    return posts;
  }

  static List<Account> parseAccount(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Account> accounts =
        list.map((model) => Account.fromJson(model)).toList();
    return accounts;
  }

  // static Future<List<Post>> fetchPosts({int page = 1}) async {
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     return compute(parsePost, response.body);
  //   } else if (response.statusCode == 404) {
  //     throw Exception("Not found");
  //   } else
  //     throw Exception('Can\'t get post');
  // }
}

class dataServices {
  List<Post> postFromJson(String str) =>
      List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
  String postToJson(List<Post> data) =>
      json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
  var url = Uri.parse('https://664784812bb946cf2f9e0700.mockapi.io/place');

  Future<List<Post>> getPosts() async {
    var response = await http.get(url);
    return postFromJson(response.body);
  }

  List<Account> accountFromJson(String str) =>
      List<Account>.from(json.decode(str).map((x) => Account.fromJson(x)));
  String accountToJson(List<Account> data) =>
      json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
  var urlAccount =
      Uri.parse('https://664784812bb946cf2f9e0700.mockapi.io/user');

  Future<List<Account>> getAccounts() async {
    var response = await http.get(urlAccount);
    return accountFromJson(response.body);
  }

  Future<List<Account>> getFavoriteAccounts() async {
    var response = await http.get(urlAccount);
    if (response.statusCode == 200) {
      List<Account> accounts = accountFromJson(response.body);
      // Filter accounts based on favorite
      List<Account> favoriteAccounts =
          accounts.where((account) => account.favorite!.isNotEmpty).toList();
      return favoriteAccounts;
    } else {
      throw Exception('Failed to load favorite accounts');
    }
  }
}
