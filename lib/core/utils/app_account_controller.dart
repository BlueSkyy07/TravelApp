import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/account.dart';
import '../network/network_requestlocation.dart';

class AccountController extends GetxController {
  RxList<Account> accounts = RxList<Account>();
  var isLoading = false.obs;
  var account = Account().obs;
  RxBool checklogin = true.obs;
  RxList<Account> favoriteResults = RxList<Account>();
  RxString idAccount = ''.obs;
  RxString username = ''.obs;
  RxString id = ''.obs;
  RxString sex = ''.obs;
  RxString phonenumber = ''.obs;
  var schedule = <Schedule>[].obs;
  var favorite = <String>[].obs;
  // var schedule = Schedule(
  //   id: [],
  //   datetime: ''
  // ).obs;
  @override
  void onInit() {
    super.onInit();
    getAccounts();
  }

  Future<void> getAccounts() async {
    isLoading.value = true;
    try {
      var response = await dataServices().getAccounts();
      if (response is List<Account>) {
        accounts.addAll(response);
      }
    } catch (e) {
      print('Error fetching Accounts: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // void addFavorite() {
  //   favorite.value = ['1', '2', '3'];
  //   // favorite.assignAll(['1', '2', '3']);
  //   print("Favorite: ${favorite.value}");
  // }

  bool isFavorite(String id) {
    return favorite.contains(id);
  }

  void ChangeLogin() {
    checklogin.value = true;
  }

  Future<void> getAccount(String UserId) async {
    isLoading.value = true;
    try {
      await dataServices().GetAccount(UserId);
      print("ten User: ${username.value}");
      print("phonenumber: ${phonenumber.value}");
      print("Id: ${id}");
      print("Favorite: ${favorite}");
      print("Schedule: ${schedule}");
    } catch (e) {
      print('Error fetching Accounts: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> fetchUserById(String userId) async {
  //   try {
  //     final response = await http
  //         .get(Uri.parse('https://664784812bb946cf2f9e0700.mockapi.io/user'));
  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body) as List;
  //       var user = jsonResponse
  //           .map((item) => Account.fromJson(item))
  //           .firstWhere((user) => user.id == userId);

  //       id.value = user.id!;
  //       username.value = user.username!;
  //       sex.value = user.sex!;
  //       phonenumber.value = user.phonenumber!;
  //       favorite.value = user.favorite ?? [];
  //     } else {
  //       print("Failed to load users");
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }
}
