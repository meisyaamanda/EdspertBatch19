import 'package:bloc/bloc.dart';
import 'package:immersive_boothcamp/data/model/question_response_model.dart';
import 'package:meta/meta.dart';

import '../../data/services/course_remote_data.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  
  QuestionBloc() : super(QuestionInitial()) {
    on<QuestionEvent>((event, emit)  {});
  }
}
