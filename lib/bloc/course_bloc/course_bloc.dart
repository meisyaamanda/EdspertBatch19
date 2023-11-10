import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immersive_boothcamp/data/model/course_response_model.dart';
import 'package:immersive_boothcamp/data/services/course_remote_data.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRemoteData courseRemoteData;

  CourseBloc({required this.courseRemoteData}) : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      if(event is GetCourseListEvent){
        emit(CourseLoading());

        final result = await courseRemoteData.getCourses();

        emit(CourseSuccess(courseResponse: result));
      }
    });
  }
}
