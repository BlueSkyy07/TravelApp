import 'package:exam/core/utils/app_utility.dart';
import 'package:exam/core/values/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../core/utils/app_connection_controller.dart';
import '../../core/utils/app_controller.dart';
import '../../data/services/app_setting.dart';
import '../../core/values/colors.dart';

class DashboardController extends FullLifeCycleController
    with FullLifeCycleMixin, GetSingleTickerProviderStateMixin {
  final appSetting = Get.find<AppSetting>();
  final appController = Get.find<AppController>();

  final tabIndex = 0.obs;
  late List<Widget> pages = [];
  late PageController pageController;
  late TabController tabController;

  // Danh sách các category
  final List<Map<String, dynamic>> categories = [
    {'title': 'Category 1', 'image': AppAssets.camping},
    {'title': 'Category 2', 'image': AppAssets.camping},
    {'title': 'Category 3', 'image': AppAssets.camping},
    {'title': 'Category 4', 'image': AppAssets.camping},
    {'title': 'Category 5', 'image': AppAssets.camping},
  ];

  void changeTabIndex(int index) async {
    tabIndex.value = index;
    pageController.jumpToPage(tabIndex.value);
    tabController.animateTo(index);
  }

  @override
  void onInit() async {
    super.onInit();
    //

    pageController =
        PageController(initialPage: tabIndex.value, keepPage: true);
    pages = [
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  'https://static.wikia.nocookie.net/naruto/images/b/bb/Itachi.png/revision/latest/scale-to-width-down/300?cb=20220214112531'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text("Hello world!"),
                          ),
                        ],
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {},
                          child: Icon(Icons.notifications_none),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Container(
                    child: Text(
                      "Where do you want to explore today?",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  child: InkWell(
                      onTap: () {
                        print('serach');
                      },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: fsearch),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Text(
                                'Search destination',
                                style: TextStyle(color: kGrayColor),
                              )),
                              Container(
                                child: Icon(Icons.search_sharp),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Choose Category",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                'See all',
                                style: TextStyle(color: kBgGuildItemColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 54, // Chiều cao của ListView
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        title: categories[index]['title'],
                        image: categories[index]['image'],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Favorite Place',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text('Explore',
                            style: TextStyle(color: kBgGuildItemColor))
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 200,
                    height: 320,
                    child: Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 320,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  24), // Bo góc cho hình ảnh
                              child: Image.asset(
                                AppAssets.dainoi,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Positioned(
                            bottom: 20,
                            left: 20,
                            child: Column(
                              children: [
                                Text(
                                  'Đại Nội',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.white,
                                      ),
                                      Text('Hue, VietNam',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  child: RatingBar.builder(
                                    initialRating: 1,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                )
                              ],
                            )),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.grey,
      ),
    ];
    tabController = TabController(length: pages.length, vsync: this);
    //
    DefaultCacheManager().emptyCache();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  @override
  void onInactive() {
    //print('DashboardController - onInative called');
  }

  @override
  void onPaused() {
    //print('DashboardController - onPaused called');
  }

  @override
  void onResumed() async {
    bool isOnline = Get.find<AppConnectionController>().isOnline;
    if (!isOnline) {
      AppUtility.showSnack('No internet!', 'Check internet on your device');
    }
  }

  @override
  void onDetached() {}

  @override
  void onHidden() {}
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  // late  VoidCallback onTap;
  CategoryItem({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: fsearch),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          print('object');
        },
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Image.asset(image),
          ],
        ),
      ),
    );
  }
}
