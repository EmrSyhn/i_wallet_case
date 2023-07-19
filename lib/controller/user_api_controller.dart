import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';
import '../model/user_photo.dart';
import '../service/service.dart';

class UserApiController {
  final UserLoginServies _userLoginServies = UserLoginServies();
  List<UserModel> userModel = [];
  List<UserPhoto> userPhoto = [];
  RxList<UserModel> filteredUsers = RxList<UserModel>();

  TextEditingController searchController = TextEditingController();
  Future<void> apiConnections() async {
    try {
      userPhoto.clear();
      await _userLoginServies.userApi().then(
        (value) async {
          if (value.statusCode == 200) {
            final userModel = userModelFromJson(value.body);

            this.userModel = userModel;
            filteredUsers.value = userModel;

            for (var i = 0; i < filteredUsers.length; i++) {
              await getUserInfo(filteredUsers[i].id!);
            }

            Get.toNamed("/userPage");
          } else {
            return Future.error("Error");
          }
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void search(String value) {
    if (searchController.text.isEmpty) {
      filteredUsers.value = userModel;
    } else {
      filteredUsers.value =
          userModel.where((user) => user.username!.contains(value)).toList();
    }
  }

  Future<void> getUserInfo(int index) async {
    await _userLoginServies.userPhoto(index).then(
      (value) {
        if (value.statusCode == 200) {
          final userPhoto = userPhotoFromJson(value.body);

          this.userPhoto.add(userPhoto);
        } else {
          return Future.error("Error");
        }
      },
    );
  }
}
