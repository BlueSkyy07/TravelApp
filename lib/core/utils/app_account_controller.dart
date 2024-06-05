import 'package:get/get.dart';

import '../model/account.dart';
import '../network/network_requestlocation.dart';

class AccountController extends GetxController {
  RxList<Account> accounts = RxList<Account>();
  var isLoading = false.obs;
  var account = Account().obs;
  RxList<Account> favoriteResults = RxList<Account>();
  RxString idAccount = ''.obs;
  RxString username = ''.obs;
  RxString schedule = ''.obs;
  var favorite = <String>['5', '4', '2'].obs;
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
}
