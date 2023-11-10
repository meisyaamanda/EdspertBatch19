import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immersive_boothcamp/presentation/course/course_list.dart';

import '../../bloc/course_bloc/course_bloc.dart';
import '../../core/utils/theme.dart';

class CourseScreen extends StatelessWidget {
  final CourseBloc courseBloc;

  const CourseScreen({super.key, required this.courseBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => courseBloc,
      child: Scaffold(
        backgroundColor: Color(0xFFF3F7F8),
        appBar: AppBar(
          backgroundColor: bluePrimary,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Pilih Pelajaran',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 12.0),
          child: BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              if (state is CourseFailed) {
                return Center(
                  child: Text(state.message ?? ''),
                );
              } else if (state is CourseSuccess) {
                return CourseListWidget(
                  courseList: state.courseResponse.data ?? [],
                  isHomeScreen: false,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}