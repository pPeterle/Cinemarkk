import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(58, 120, 255, 1),
        scaffoldBackgroundColor: Color.fromRGBO(12, 12, 12, 1),
        backgroundColor: Color.fromRGBO(25, 25, 25, 1),
        accentColor: Color.fromRGBO(66,93, 153, 1)
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
