import 'package:apod_app_a1/src/screens/home_screens.dart';
import 'package:flutter/cupertino.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'APOD App',
      home: HomeScreen(),
    );
  }
}
