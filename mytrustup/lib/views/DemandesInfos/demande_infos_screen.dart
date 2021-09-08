import 'package:flutter/material.dart';
import 'package:mytrustup/widgets/logo.dart';

class DemandesInfosScreen extends StatelessWidget {
  const DemandesInfosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Logo(),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
    );
  }
}
