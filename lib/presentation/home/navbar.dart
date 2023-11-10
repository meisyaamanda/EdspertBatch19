import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:immersive_boothcamp/presentation/discuss.dart';
import 'package:immersive_boothcamp/presentation/home/home_screen.dart';
import 'package:immersive_boothcamp/presentation/profil/profil_screen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List<dynamic> screen = [
    HomeScreen(),
    ProfilScreen(),
    DiskusiScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Diskusi Soal',
          icon: Icon(Icons.quiz),
        ),
        BottomNavigationBarItem(
          label: 'Profil',
          icon: Icon(Icons.person),
        ),
      ]),
    );
  }
}
