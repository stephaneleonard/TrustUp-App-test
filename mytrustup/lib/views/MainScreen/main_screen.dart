import 'package:flutter/material.dart';
import 'package:mytrustup/views/Accueil/accueil_screen.dart';
import 'package:mytrustup/views/Demandes/demandes_screen.dart';
import 'package:mytrustup/views/MainScreen/custom_drawer.dart';
import 'package:mytrustup/views/Messages/messages_screen.dart';
import 'package:mytrustup/views/Photos/photos_screen.dart';
import 'package:mytrustup/widgets/logo.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2;

  final List<Widget> _pages = <Widget>[
    const Accueil(),
    const Photos(),
    const Demandes(),
    const Messages()
  ];

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Logo(),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: const CustomDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onItemTap,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Accueil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined), label: 'photos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_drive_file_sharp), label: 'Demandes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined), label: 'Messages'),
        ],
      ),
    );
  }
}
