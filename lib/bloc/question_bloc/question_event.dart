part of 'question_bloc.dart';

@immutable
sealed class QuestionEvent {}

class GetQuestionListEvent extends QuestionEvent{}