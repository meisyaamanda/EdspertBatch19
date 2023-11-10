import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:immersive_boothcamp/data/model/exercise_response_model.dart';
import '../../constants/constants.dart';
import '../model/course_response_model.dart';

class CourseRemoteData {
  Future<CourseResponse> getCourses() async {
    try {
      final url = '${LearningConstants.baseUrl}${LearningConstants.coursepath}';

      final result = await Dio().get(
        url,
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );

      log('Result Course: ${result}');

      final courseResponse = CourseResponse.fromJson(result.data);

      return courseResponse;
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace, error: e);
      rethrow;
    }
  }

  Future<ExerciseResponse> getExercise(String courseId) async {
    try {
      final url =
          '${LearningConstants.baseUrl}${LearningConstants.exerciseList}';

      final result = await Dio().get(url,
          options: Options(
            headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
          ),
          queryParameters: {
            'course_id': courseId,
            'user_email': 'testerngbayu@gmail.com'
          });

      final exerciseResponse = ExerciseResponse.fromJson(result.data);
      log('Exercise response = ${json.encode(result.data)}');

      return exerciseResponse;
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace, error: e);
      rethrow;
    }
  }

  Future GetQuestionList(String exerciseId) async {
    try {
      final url =
          '${LearningConstants.baseUrl}${LearningConstants.questionList}';
      final formData = FormData.fromMap({
        'exercise_id': exerciseId,
        'user_email': 'testerngbayu@gmail.com',
      });

      final result = await Dio().post(
        url,
        data: formData,
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );

      log('Resultnya $exerciseId : ${json.encode(result.data)}');

      final exerciseResponse = ExerciseResponse.fromJson(result.data);

      return exerciseResponse;
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace, error: e);
      rethrow;
    }
  }
}
