import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:github_follower/core/api/api_constants.dart';
import 'package:github_follower/models/user/user_model.dart';

class UserPageController extends GetxController {
  final Dio dio = Dio();

  TextEditingController userNameController = TextEditingController();
  User? userData;

  Future<void> getUserData() async {
    final userName = userNameController.text.trim();

    try {
      final response = await Dio().get(
        APIConstants.user.replaceFirst(
          "{username}",
          userName,
        ),
      );
      if (response.statusCode != 200) {
        debugPrint("Error -> ${response.statusCode}");
        return;
      }

      userData = User.fromJson(response.data);
      update();
    } catch (e) {
      debugPrint("Error -> $e");
    }
  }

  void clearUserData() {
    userData = null;
    update();
  }
}
