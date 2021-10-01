import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_text/view/home/model/user.dart';

// ignore: constant_identifier_names
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
          age: 24,
          dateTime: DateTime.now(),
        ),
      );
      Future.delayed(const Duration(seconds: 5))
          .then((value) => userState.value = UserState.IDLE);
    } catch (e) {
      userState.value = UserState.ERROR;
    }
  }

  bool emptyCheck() =>
      nameController.text.isNotEmpty &&
      surnameController.text.isNotEmpty &&
      ageController.text.isNotEmpty;

  void addUser() {
    if (emptyCheck()) {
      userList.add(
        UserModel(
          name: nameController.text,
          surname: surnameController.text,
          age: int.parse(ageController.text),
          dateTime: DateTime.now(),
        ),
      );
      nameController.clear();
      surnameController.clear();
      ageController.clear();
    } else {
      Get.snackbar("Uyarı", "Ad,soyad ve yaş alanları boş geçilemez.");
    }
  }
}
