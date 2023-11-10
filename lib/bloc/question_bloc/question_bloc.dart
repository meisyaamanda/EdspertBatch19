import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immersive_boothcamp/data/model/question_response_model.dart';
import 'package:meta/meta.dart';

import '../../data/services/course_remote_data.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final CourseRemoteData courseRemoteData;
  
  QuestionBloc({required this.courseRemoteData}) : super(QuestionInitial()) {
    on<QuestionEvent>((event, emit) async {
      if(event is GetQuestionListEvent){
        emit(QuestionLoading());

        print('a');
        final result = await courseRemoteData.getQuestionList(event.exercise_id_fk);

        emit(QuestionSuccess(questionResponse: result));
      }
    });
  }
}
