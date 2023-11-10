import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immersive_boothcamp/bloc/exercise_bloc/exercise_bloc.dart';
import 'package:immersive_boothcamp/presentation/question/question_screen.dart';
import 'package:immersive_boothcamp/data/services/course_remote_data.dart';
import 'package:immersive_boothcamp/core/utils/theme.dart';

class ExerciseScreen extends StatelessWidget {
  final String courseId;
  final String majorName;
  const ExerciseScreen({
    super.key,
    required this.courseId,
    required this.majorName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseBloc(
        courseRemoteData: CourseRemoteData(),
      )..add(
          GetExerciseListEvent(courseId: courseId),
        ),
      child: Scaffold(
        backgroundColor: bgColor,
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
          title: Text(
            majorName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<ExerciseBloc, ExerciseState>(
            builder: (context, state) {
              if (state is ExerciseSuccess) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionScreen(),
                      ),
                    );
                  },
                  child: GridView.builder(
                    itemCount: state.exerciseResponse.data?.length,
                    itemBuilder: (context, index) {
                      final exercise = state.exerciseResponse.data?[index];
                      return Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 36,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    exercise?.icon ?? '',
                                    height: 16,
                                    width: 16,
                                    errorBuilder:
                                        (context, error, StackTrace) =>
                                            Container(
                                      width: 28,
                                      height: 28,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  exercise?.exerciseTitle ?? 'No Title',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '${exercise?.jumlahDone}/${exercise?.jumlahSoal}',
                                  style: const TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                    ),
                  ),
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
