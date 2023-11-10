part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final UserModel userModel;

  UserSuccess({required this.userModel});
}

final class UserFailed extends UserState {
  final String? message;

  UserFailed({required this.message});
}