import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(const NavbarInitial(tabIndex: 0)) {
    on<NavbarEvent>((event, emit) {
      if(event is TabChange){
        emit(NavbarInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
