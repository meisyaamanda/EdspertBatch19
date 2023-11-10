part of 'navbar_bloc.dart';

@immutable
abstract class NavbarEvent {}

class TabChange extends NavbarEvent{
  final int tabIndex;

  TabChange({required this.tabIndex});


}
