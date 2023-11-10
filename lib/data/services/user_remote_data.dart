import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:immersive_boothcamp/data/model/user_model.dart';

import '../../constants/constants.dart';

class UserRemoteData {
  Future<UserModel> getUser() async {
    try {
      final url = '${LearningConstants.baseUrl}${LearningConstants.userpath}';

      final result = await Dio().get(
        url,
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );

      log('Result Course: ${result}');

      final userModel = UserModel.fromJson(result.data);

      return userModel;
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace, error: e);
      rethrow;
    }
  }
}