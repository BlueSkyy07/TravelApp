import 'package:exam/core/model/account.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../utils/app_account_controller.dart';
import '../model/post.dart';
import '../network/network_requestlocation.dart';

class LocationController extends GetxController {
  RxList<Post> posts = RxList<Post>();
  RxList<Account> accounts = RxList<Account>();
  RxBool checkLogin = false.obs;
  var isLoading = false.obs;
  var location = Post().obs;
  var account = Account().obs;
  RxString userId = ''.obs;
  RxList<Account> favoriteResults = RxList<Account>();
  RxList<Post> searchResults = RxList<Post>();

  @override
  void onInit() {
    super.onInit();
    getPosts();
    getFavorite();
  }

  void setLocation(Post newLocation) {
    location.value = newLocation;
  }

  Future<void> getPosts() async {
    isLoading.value = true;
    try {
      var response = await dataServices().getPosts();
      if (response is List<Post>) {
        posts.addAll(response);
      }
    } catch (e) {
      print('Error fetching posts: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getFavorite() async {
    isLoading.value = true;
    try {
      // Assuming userId is '1' for now, as per your code
      userId.value = '1';
      var response = await dataServices().getFavoriteAccounts();
      if (response != null) {
        favoriteResults.assignAll(
            response); // Assign favorite accounts to favoriteResults list
      }
      print(response);
    } catch (e) {
      print('Error fetching favorite accounts: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void searchLocations(String query) {
    if (query.isEmpty) {
      searchResults.value = [];
    } else {
      searchResults.value = posts
          .where((location) =>
              location.category!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      print(searchResults);
    }
  }
}
