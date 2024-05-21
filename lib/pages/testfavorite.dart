import 'package:exam/core/utils/app_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final LocationController favoriteLocal = Get.put(LocationController());
  void onSearchPressed() {
    favoriteLocal.getFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite Locations'),
        ),
        body: Obx(() => Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: onSearchPressed,
                    child: Text('Search'),
                  ),
                ],
              ),
            )));
  }
}
