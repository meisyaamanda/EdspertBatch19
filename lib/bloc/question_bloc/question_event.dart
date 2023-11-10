part of 'question_bloc.dart';

@immutable
sealed class QuestionEvent {}

class GetQuestionListEvent extends QuestionEvent{
  final String exercise_id_fk;

  GetQuestionListEvent({required this.exercise_id_fk});
  
}