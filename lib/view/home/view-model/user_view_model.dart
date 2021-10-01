import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_text/view/home/model/user.dart';

enum UserState { IDLE, BUSY, ERROR }

class UserViewModel {
  Rx<UserState> userState = UserState.BUSY.obs;
  RxList<UserModel> userList = <UserModel>[].obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  UserViewModel() {
    fetchUser();
  }

  void fetchUser() {
    try {
      userState.value = UserState.BUSY;
      userList.add(
        UserModel(
          name: "Doğan Ali",
          surname: "Yeniacun",
          age: "24",
          dateTime: DateTime.now(),
        ),
      );
      Future.delayed(const Duration(seconds: 5))
          .then((value) => userState.value = UserState.IDLE);
    } catch (e) {
      userState.value = UserState.ERROR;
    }
  }

  void addUser() {
    userList.add(
      UserModel(
        name: nameController.text,
        surname: surnameController.text,
        age: ageController.text,
        dateTime: DateTime.now(),
      ),
    );
    nameController.clear();
    surnameController.clear();
    ageController.clear();
  }
}
