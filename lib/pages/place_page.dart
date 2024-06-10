import 'dart:ui';

import 'package:exam/core/model/post.dart';
import 'package:exam/core/utils/app_location_controller.dart';
import 'package:exam/pages/detail_place_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyPlane extends StatefulWidget {
  const MyPlane({super.key});

  @override
  State<MyPlane> createState() => _MyPlaneState();
}

class _MyPlaneState extends State<MyPlane> with SingleTickerProviderStateMixin {
  final LocationController locationController = Get.put(LocationController());
  late AnimationController _controller;
  late Animation _colorAnimated;
  late Animation<double> _sizeAnimated;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    _colorAnimated =
        ColorTween(begin: Colors.white, end: Colors.red).animate(_controller);

    _sizeAnimated = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 30, end: 50), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 50, end: 30), weight: 50)
    ]).animate(_controller);

    _controller.addListener(() {
      print(_controller.value);
      print(_colorAnimated.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isFav = true;
      } else {
        isFav = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Post location = locationController.location.value;
      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
              body: Stack(
            fit: StackFit.expand,
            children: [
              // Image.asset(
              //   "Asset/Images/bg.jpg",
              //   fit: BoxFit.cover,
              // ),
              Image.network(
                location.image!,
                fit: BoxFit.cover,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.7, sigmaY: 1.7),
                child: Container(
                  child: Text(""),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
                  // decoration: BoxDecoration(color: Colors.red),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 0,
                          child: IconButton(
                              onPressed: () {},
                              icon: FaIcon(
                                FontAwesomeIcons.arrowLeft,
                                color: Colors.white,
                                size: 25,
                              ))),
                      Expanded(
                        flex: 0,
                        child: IconButton(
                            onPressed: () {
                              isFav
                                  ? _controller.reverse()
                                  : _controller.forward();
                            },
                            icon: Icon(Icons.favorite,
                                color: _colorAnimated.value,
                                size: _sizeAnimated.value)),
                      )
                    ],
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // decoration: BoxDecoration(color: Colors.red),
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    margin: EdgeInsets.only(top: 150),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 8,
                    child: Text(
                      location.title!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          location.location!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),

                  Container(
                    // decoration: BoxDecoration(color: Colors.red),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      location.description!,
                      style: TextStyle(
                          height: 2.0,
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                  // SizedBox(
                  //   height: 70,
                  // ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {
                          Get.to(MyInformation());
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.arrowDown,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ],
          ));
        },
      );
    });
  }
}
