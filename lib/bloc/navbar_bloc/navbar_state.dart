part of 'navbar_bloc.dart';

@immutable
abstract class NavbarState {
  final int tabIndex;

  const NavbarState({required this.tabIndex});
}

final class NavbarInitial extends NavbarState {
  const NavbarInitial({required super.tabIndex});
}
