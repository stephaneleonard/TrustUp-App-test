import 'package:flutter/material.dart';
import 'package:mytrustup/utils/theme.dart';
import 'package:mytrustup/views/DemandesInfos/demande_infos_screen.dart';
import 'package:mytrustup/views/MainScreen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My TrustUp',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: MainScreen(),
      routes: <String, Widget Function(BuildContext)>{
        '/demande': (BuildContext context) => const DemandesInfosScreen(),
      },
    );
  }
}
