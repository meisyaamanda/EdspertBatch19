import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiskusiScreen extends StatelessWidget {
  const DiskusiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Center(
        child: Text('Diskusi'),
      )),
    );
  }
}