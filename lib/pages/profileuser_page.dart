import 'package:exam/core/utils/app_account_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileUser extends StatelessWidget {
  ProfileUser({super.key});

  final AccountController accountController = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Center(
          child: Column(
            children: [
              Container(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://static.wikia.nocookie.net/naruto/images/b/bb/Itachi.png/revision/latest/scale-to-width-down/300?cb=20220214112531'),
                ),
              ),
              Container(
                child: Text(
                  "${accountController.username}",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  print('object');
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    // color: Colors.red,
                    border: Border.all(width: 2, color: Colors.grey),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(3, 6),
                    //     color: Colors.black12,
                    //   )
                    // ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Persional Information',
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.account_circle_outlined)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  print('object');
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    // color: Colors.red,
                    border: Border.all(width: 2, color: Colors.grey),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(3, 6),
                    //     color: Colors.black12,
                    //   )
                    // ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'FAQ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.chat_outlined)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  print('object');
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    // color: Colors.red,
                    border: Border.all(width: 2, color: Colors.grey),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(3, 6),
                    //     color: Colors.black12,
                    //   )
                    // ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dark Mode',
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.switch_camera_outlined)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  print('object');
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    // color: Colors.red,
                    border: Border.all(width: 2, color: Colors.grey),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(3, 6),
                    //     color: Colors.black12,
                    //   )
                    // ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Language',
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.language)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  // await FirebaseAuth.instance.signOut();
                  // accountController.checklogin.value = false;
                  // print("${accountController.checklogin.value}");
                  // Show SnackBar
                  Get.bottomSheet(
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Text(
                              'LOGOUT',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // SizedBox(height: 10),
                          Text('Are you sure you want to logout?'),
                          // SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Center(child: Text("Cancle")),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  Get.back();
                                  await FirebaseAuth.instance.signOut();
                                  accountController.checklogin.value = false;

                                  print(
                                      "${accountController.checklogin.value}");
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Center(child: Text("Logout")),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    // color: Colors.red,
                    border: Border.all(width: 2, color: Colors.grey),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(3, 6),
                    //     color: Colors.black12,
                    //   )
                    // ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Logout',
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.logout_outlined)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}