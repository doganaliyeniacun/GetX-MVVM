// ignore_for_file: avoid_unnecessary_containers, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_text/view/home/view-model/user_view_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  UserViewModel userViewModel = Get.put(UserViewModel());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Obx(
          () => Container(
            child: userViewModel.userState == UserState.BUSY
                ? const Center(child: CircularProgressIndicator())
                : userViewModel.userState == UserState.ERROR
                    ? const Center(child: Text("Error"))
                    : Center(
                        child: Text(
                            "Adı : ${userViewModel.userList[0].name} Soyadı : ${userViewModel.userList[0].surname} Yaşı : ${userViewModel.userList[0].age}"),
                      ),
          ),
        ),
      ),
    );
  }
}
