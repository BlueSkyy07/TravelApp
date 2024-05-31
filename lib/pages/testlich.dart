import 'package:exam/core/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class TestLich extends StatelessWidget {
  const TestLich({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border.all(width: 1, color: Colors.black12),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                // height: 300,
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
                      child: Center(child: Text("18, May, 2024")),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://mientrungtourism.com/uploads/cms/1702022614.jpg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            height: 140,
                            width: 100,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Dai noi',
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
                                            rating: 4.9,
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            '4.9',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "The Imperial City, also known as the Citadel, is a must-visit destination in Hue, Vietnam. It served as the royal palace of the Nguyen Dynasty, the last feudal dynasty of Vietnam, from the early 19th century until the mid-20th century. This UNESCO World Heritage Site showcases the opulence, architectural beauty, and rich culture of the Nguyen dynasty. Visitors can explore the intricate design of the palaces, temples, gates, and walls within the complex, gaining insight into Vietnam's royal history. The Imperial City offers a fascinating journey through time, making it an essential stop for travelers seeking to immerse themselves in Vietnam's cultural heritage.",
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
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border.all(width: 1, color: Colors.black12),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                // height: 300,
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
                      child: Center(child: Text("25, May, 2024")),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://mientrungtourism.com/uploads/cms/1702022614.jpg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            height: 140,
                            width: 100,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Dai noi',
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
                                            rating: 4.9,
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            '4.9',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "The Imperial City, also known as the Citadel, is a must-visit destination in Hue, Vietnam. It served as the royal palace of the Nguyen Dynasty, the last feudal dynasty of Vietnam, from the early 19th century until the mid-20th century. This UNESCO World Heritage Site showcases the opulence, architectural beauty, and rich culture of the Nguyen dynasty. Visitors can explore the intricate design of the palaces, temples, gates, and walls within the complex, gaining insight into Vietnam's royal history. The Imperial City offers a fascinating journey through time, making it an essential stop for travelers seeking to immerse themselves in Vietnam's cultural heritage.",
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
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://mientrungtourism.com/uploads/cms/1702022614.jpg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            height: 140,
                            width: 100,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Dai noi',
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
                                            rating: 4.9,
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            '4.9',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "The Imperial City, also known as the Citadel, is a must-visit destination in Hue, Vietnam. It served as the royal palace of the Nguyen Dynasty, the last feudal dynasty of Vietnam, from the early 19th century until the mid-20th century. This UNESCO World Heritage Site showcases the opulence, architectural beauty, and rich culture of the Nguyen dynasty. Visitors can explore the intricate design of the palaces, temples, gates, and walls within the complex, gaining insight into Vietnam's royal history. The Imperial City offers a fascinating journey through time, making it an essential stop for travelers seeking to immerse themselves in Vietnam's cultural heritage.",
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
