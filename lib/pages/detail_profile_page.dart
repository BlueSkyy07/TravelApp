import 'package:exam/core/utils/app_account_controller.dart';
import 'package:exam/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailprofilePage extends StatelessWidget {
  DetailprofilePage({super.key});

  final AccountController accountController = Get.put(AccountController());
  final _fullnameController = TextEditingController();
  final _genderController = TextEditingController();
  final _phonenumberController = TextEditingController();

  final List<String> genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryFullBgColor,
      appBar: AppBar(
        title: Text(
          "Persionnal Information",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() => Center(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Thông tin cá nhân'),
                            accountController.checkEditInf.value == false
                                ? TextButton(
                                    onPressed: () async {
                                      accountController.ChangeInf();
                                      print(
                                          '${accountController.checkEditInf}');
                                    },
                                    child: Text('Edit'))
                                : TextButton(
                                    onPressed: () async {
                                      accountController.ChangeInf();
                                      // // Update the fullname, gender, and phonenumber in the controller with the values from the text fields
                                      // accountController.username.value =
                                      //     _fullnameController.text;
                                      // accountController.sex.value =
                                      //     _genderController.text;
                                      // accountController.phonenumber.value =
                                      //     _phonenumberController.text;
                                      print(
                                          '${accountController.checkEditInf}');
                                    },
                                    child: Text('Save'))
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Container(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Full Name'),
                            accountController.checkEditInf.value == false
                                ? Text('${accountController.username}')
                                : Container(
                                    width: 300,
                                    child: TextField(
                                      textAlign: TextAlign.right,
                                      autofocus: true,
                                      controller: _fullnameController
                                        ..text =
                                            accountController.username.value,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: 'Enter username',
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                      Container(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Gender'),
                            accountController.checkEditInf.value == false
                                ? Text('${accountController.sex}')
                                : Container(
                                    width: 300,
                                    child: TextField(
                                      textAlign: TextAlign.right,
                                      controller: _genderController
                                        ..text = accountController.sex.value,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: 'Enter gender',
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                      Container(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Phone Number'),
                            accountController.checkEditInf.value == false
                                ? Text('${accountController.phonenumber}')
                                : Container(
                                    width: 300,
                                    child: TextField(
                                      textAlign: TextAlign.right,
                                      controller: _phonenumberController
                                        ..text =
                                            accountController.phonenumber.value,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: 'Enter phone number',
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        child: Text('Bảo mật'),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Email'),
                            Text('${accountController.email}')
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Password'), Text('***********')],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
