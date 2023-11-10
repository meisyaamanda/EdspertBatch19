import 'package:flutter/material.dart';
import 'package:immersive_boothcamp/core/utils/theme.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text('Akun Saya'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: 320,
          width: double.infinity,
          child: Column(
            children: [
              Text('Nama Lengkap'),
            ],
          ),
        ),
      ),
    );
  }
}
