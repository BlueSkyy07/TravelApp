import 'package:exam/core/utils/app_location_controller.dart';
import 'package:exam/core/values/colors.dart';
import 'package:exam/pages/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final LocationController locationController = Get.put(LocationController());
  final TextEditingController searchController = TextEditingController();
  bool showResults = false;

  final String assetName = 'assets/images/location.svg';

  void onSearchPressed() {
    locationController.searchLocations(searchController.text);
    setState(() {
      showResults = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 50,
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: fsearch,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onSearchPressed,
              child: Text('Search'),
            ),
            showResults
                ? Expanded(
                    child: Obx(() {
                      if (locationController.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else if (locationController.searchResults.isEmpty) {
                        return Center(child: Text('No products found'));
                      } else {
                        return ListView.builder(
                          padding: const EdgeInsets.all(16.0),
                          itemCount: locationController.searchResults.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final location =
                                locationController.searchResults[index];
                            return GestureDetector(
                              onTap: () {
                                locationController.setLocation(location);
                                Get.to(DashboardController());
                              },
                              child: buildLocationCard(
                                location.image!,
                                location.title!,
                                location.description!,
                                location.rating?.rate?.toDouble() ?? 0.0,
                              ),
                            );
                          },
                        );
                      }
                    }),
                  )
                : Spacer(), // Spacer pushes the favorites section to the bottom
            if (!showResults)
              Column(
                children: [
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
                              style: TextStyle(color: kBgGuildItemColor)),
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
                                image: NetworkImage(
                                  'https://i0.wp.com/media.techcity.cloud/vietnam.vn/2023/10/Vinh-Ha-Long-1-3.jpg?fit=1280%2C853&ssl=1',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                          color: Colors.white,
                                        ),
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 15,
                                                  child: SvgPicture.asset(
                                                      assetName),
                                                ),
                                                Text(
                                                  'Hue, VietNam',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                RatingBarIndicator(
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemSize: 18,
                                                  rating: 5,
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                    Icons.star_outlined,
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                                Container(
                                                  child: Text('5',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
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
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 120,
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
            height: 120,
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
