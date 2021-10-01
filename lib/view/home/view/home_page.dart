// ignore_for_file: unrelated_type_equality_checks, unused_local_variable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_text/view/home/model/user.dart';
import 'package:getx_mvvm_text/view/home/view-model/user_view_model.dart';

class HomePage extends StatelessWidget {
  UserViewModel userViewModel = Get.put(UserViewModel());

  @override
  Widget build(BuildContext context) {
    String aboutUser =
        "Adı : ${userViewModel.userList[0].name} Soyadı : ${userViewModel.userList[0].surname} Yaşı : ${userViewModel.userList[0].age}  Kayıt Tarihi : ${userViewModel.userList[0].dateTime}";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Obx(
        () => Container(
          child: userViewModel.userState == UserState.BUSY
              ? const Center(child: CircularProgressIndicator())
              : userViewModel.userState == UserState.ERROR
                  ? const Center(child: Text("Error"))
                  : Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  TextField(
                                    controller: userViewModel.nameController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text("Name"),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextField(
                                    controller: userViewModel.surnameController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text("Surname"),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextField(
                                    controller: userViewModel.ageController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text("Age"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: ListView.builder(
                              itemCount: userViewModel.userList.length,
                              itemBuilder: (context, index) {
                                List<UserModel> list =
                                    userViewModel.userList.reversed.toList();
                                UserModel reversedList = list[index];

                                return Card(
                                  child: ListTile(
                                    title:
                                        Text("${reversedList.name!} ${reversedList.surname!}"),
                                    subtitle: Text(reversedList.age.toString()),
                                    leading: const Icon(
                                      Icons.person,
                                      size: 50,
                                    ),
                                    trailing: Text(reversedList.dateTime.toString()),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => userViewModel.addUser(),
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
