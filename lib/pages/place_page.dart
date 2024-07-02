import 'dart:ui';
import 'package:exam/core/model/post.dart';
import 'package:exam/core/utils/app_account_controller.dart';
import 'package:exam/core/utils/app_location_controller.dart';
import 'package:exam/pages/detail_place_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyPlane extends StatefulWidget {
  const MyPlane({super.key});

  @override
  State<MyPlane> createState() => _MyPlaneState();
}

class _MyPlaneState extends State<MyPlane> with SingleTickerProviderStateMixin {
  final LocationController locationController = Get.put(LocationController());
  final AccountController accountController = Get.put(AccountController());
  late AnimationController _controller;
  late Animation _colorAnimated;
  late Animation<double> _sizeAnimated;

  bool isFav(String userid) {
    String userID = userid;
    return accountController.isFavorite(userID);
  }

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
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Post location = locationController.location.value;
      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            body: GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity! < 0) {
                  // User swiped up
                  Get.to(MyInformation());
                }
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 0,
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Obx(
                            () => accountController.checklogin == false
                                ? IconButton(
                                    onPressed: () {
                                      //chuyển tới trang login
                                    },
                                    icon: Icon(Icons.favorite))
                                : isFav(location.id!) == true
                                    ? IconButton(
                                        onPressed: () async {
                                          print(isFav(location.id!));
                                          await accountController
                                              .removeFromFavorites(
                                                  "${accountController.id}",
                                                  location.id!);
                                          await accountController.getAccount(
                                              accountController.email.value);
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ))
                                    : IconButton(
                                        onPressed: () async {
                                          await accountController
                                              .addToFavorites(
                                                  "${accountController.id}",
                                                  location.id!);
                                          await accountController.getAccount(
                                              accountController.email.value);
                                          print(isFav(location.id!));
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.black,
                                        )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
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
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                      Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {
                            Get.to(MyInformation());
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.arrowDown,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
