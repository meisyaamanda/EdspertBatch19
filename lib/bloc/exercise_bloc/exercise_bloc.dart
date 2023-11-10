import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immersive_boothcamp/data/model/exercise_response_model.dart';
import 'package:immersive_boothcamp/data/services/course_remote_data.dart';
import 'package:meta/meta.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final CourseRemoteData courseRemoteData;

  ExerciseBloc({
    required this.courseRemoteData,
  }) : super(ExerciseInitial()) {
    on<ExerciseEvent>((event, emit) async {
      if (event is GetExerciseListEvent) {
        emit(ExerciseLoading());
        print('aa');

        final result = await courseRemoteData.getExercise(event.courseId);
        for (var i = 0; i < (result.data?.length ?? 0); i++) {
          await courseRemoteData.getQuestionList(
              result.data?[i].exerciseId ?? '');
        }

        emit(ExerciseSuccess(exerciseResponse: result));
      }
    });
  }
}
