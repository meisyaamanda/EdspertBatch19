import 'dart:developer';
import 'package:dio/dio.dart';
import '../../constants/constants.dart';
import '../model/banner_response_model.dart';

class BannerRemoteData {
  Future<BannerResponse> getBanners() async {
    try {
      final url = '${LearningConstants.baseUrl}${LearningConstants.bannerpath}';
      
      final result = await Dio().get(
        url,
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );

      final bannerResponse = BannerResponse.fromJson(result.data);

      return bannerResponse;
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace,
      error: e
      );
      rethrow;
    }
  }
}
