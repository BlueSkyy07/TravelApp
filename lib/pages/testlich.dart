import 'package:exam/core/model/account.dart';
import 'package:exam/core/utils/app_account_controller.dart';
import 'package:exam/core/utils/app_location_controller.dart';
import 'package:exam/core/values/colors.dart';
import 'package:exam/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class TestLich extends StatelessWidget {
  const TestLich({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.put(AccountController());
    final LocationController locationController = Get.put(LocationController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Schedule",
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(SearchPage());
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Obx(() {
          return Column(
            children: [
              ...accountController.schedule.map((schedule) {
                final schedulePosts =
                    locationController.getPostsBySchedule([schedule]);

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black12),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24)),
                          color: lich,
                        ),
                        child:
                            Center(child: Text("Date: ${schedule.datetime}")),
                      ),
                      Column(
                        children: schedulePosts.map((post) {
                          return buildLocationCard(
                              post.image!,
                              post.title!,
                              post.description!,
                              post.rating?.rate?.toDouble() ?? 0.0);
                        }).toList(),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          );
        }),
      ),
    );
  }
}

Widget buildLocationCard(
    String image, String title, String description, double rate) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.all(8),
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