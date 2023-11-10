import 'package:bloc/bloc.dart';
import 'package:immersive_boothcamp/bloc/exercise_bloc/exercise_bloc.dart';
import 'package:immersive_boothcamp/data/model/user_model.dart';
import 'package:immersive_boothcamp/data/services/user_remote_data.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRemoteData userRemoteData;

  UserBloc({required this.userRemoteData}) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is GetExerciseListEvent) {
        emit(UserLoading());

        final result = await userRemoteData.getUser();
  
        emit(UserSuccess(userModel: result));
      }
    });
  }
}
