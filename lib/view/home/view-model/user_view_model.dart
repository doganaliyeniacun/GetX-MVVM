import 'package:get/get.dart';
import 'package:getx_mvvm_text/view/home/model/user.dart';

enum UserState { IDLE, BUSY, ERROR }

class UserViewModel extends GetxController {
  Rx<UserState> userState = UserState.BUSY.obs;
  RxList<UserModel> userList = <UserModel>[].obs;

  UserViewModel() {
    fetchUser();
  }

  void fetchUser() {
    try {
      userState.value = UserState.BUSY;
      userList.add(UserModel("Doğan Ali", "Yeniacun", 24));
      Future.delayed(Duration(seconds: 5))
          .then((value) => userState.value = UserState.IDLE);
    } catch (e) {
      userState.value = UserState.ERROR;
    }
  }
}
