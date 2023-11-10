import 'package:flutter/material.dart';
import 'package:immersive_boothcamp/data/model/course_response_model.dart';
import 'package:immersive_boothcamp/presentation/exercise/exercise_screen.dart';

class CourseListWidget extends StatelessWidget {
  final List<CourseData> courseList;
  final bool isHomeScreen;
  const CourseListWidget({
    super.key,
    required this.courseList,
    this.isHomeScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
      physics: isHomeScreen
          ? const NeverScrollableScrollPhysics()
          : BouncingScrollPhysics(),
      itemCount: isHomeScreen ? 3 : courseList.length,
      itemBuilder: (context, index) {
        final course = courseList[index];

        return InkWell(
          onTap: () {
            print('Course Id = ${course.courseId}');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseScreen(
                  courseId: course.courseId ?? '',
                  majorName: course.majorName ?? '',
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 22),
            height: 96,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F7F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    course.urlCover ?? '',
                    width: 28,
                    height: 28,
                    errorBuilder: (context, error, StackTrace) => Container(
                      width: 28,
                      height: 28,
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.majorName ?? 'No Course Name',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${course.jumlahDone} / ${course.jumlahMateri} Paket latihan soal',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF8E8E8E),
                        ),
                      ),
                      LinearProgressIndicator(
                        value: 0.5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
