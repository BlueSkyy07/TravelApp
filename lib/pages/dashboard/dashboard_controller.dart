import 'dart:ffi';

import 'package:exam/core/utils/app_location_controller.dart';
import 'package:exam/core/utils/app_utility.dart';
import 'package:exam/core/values/image.dart';
import 'package:exam/pages/search_page.dart';
import 'package:exam/pages/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/utils/app_connection_controller.dart';
import '../../core/utils/app_controller.dart';
import '../../data/services/app_setting.dart';
import '../../core/values/colors.dart';
import '../testfavorite.dart';

class DashboardController extends FullLifeCycleController
    with FullLifeCycleMixin, GetSingleTickerProviderStateMixin {
  final appSetting = Get.find<AppSetting>();
  final appController = Get.find<AppController>();
  final LocationController location = Get.put(LocationController());
  final tabIndex = 0.obs;
  late List<Widget> pages = [];
  late PageController pageController;
  late TabController tabController;
  final String assetName = 'assets/images/location.svg';
  bool checkLogin = true;

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
                        Get.to(SearchPage());
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
                checkLogin
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Favorite Place',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Explore',
                                      style:
                                          TextStyle(color: kBgGuildItemColor))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 230,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 230,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            // image: AssetImage(AppAssets.dainoi),
                                            image: NetworkImage(
                                                'https://i0.wp.com/media.techcity.cloud/vietnam.vn/2023/10/Vinh-Ha-Long-1-3.jpg?fit=1280%2C853&ssl=1'),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(24))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                50)),
                                                    color: Colors.white),
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Dai noi',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 15,
                                                          child:
                                                              SvgPicture.asset(
                                                                  assetName),
                                                        ),
                                                        Text(
                                                          'Hue, VietNam',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        RatingBarIndicator(
                                                            direction:
                                                                Axis.horizontal,
                                                            itemCount: 5,
                                                            itemSize: 18,
                                                            rating: 5,
                                                            itemBuilder:
                                                                (context,
                                                                        index) =>
                                                                    Icon(
                                                                      Icons
                                                                          .star_outlined,
                                                                      color: Colors
                                                                          .amber,
                                                                    )),
                                                        Container(
                                                          child: Text('5',
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .white)),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                      )),
                                );
                              },
                            ),
                          )
                        ],
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Package',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            print(location.posts.length);
                            Get.to(TestPage());
                            // Get.to(FavoritePage());
                          },
                          child: Text("See All",
                              style: TextStyle(color: kBgGuildItemColor)),
                        )
                      ],
                    ),
                  ),
                ),
                Obx(() => Container(
                      child: Column(
                          children: List.generate(
                        location.posts.length,
                        (index) => buildLocationCard(
                            location.posts[index].image!,
                            location.posts[index].title!,
                            location.posts[index].description!,
                            location.posts[index].rating?.rate?.toDouble() ??
                                0.0),
                      )),
                    ))
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

Widget buildLocationCard(
    String image, String title, String description, double rate) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(24))),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: 160,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            height: 140,
            width: 100,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.black12,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            itemCount: 5,
                            itemSize: 20,
                            rating: rate,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '$rate',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
