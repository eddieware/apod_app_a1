import 'package:apod_app_a1/src/screens/apod_screen.dart';
import 'package:apod_app_a1/src/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //todo metodo bu¡ld tiene que tener un context y es un objeto que es pasado en tre todos los objetos de esta clase

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          title: Text('APOD'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.share_up),
          title: Text('Settings'),
        ),
      ]),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          // here to get the number of cases and know wich is selected
          //routes: getApplicationRoutes(),
          builder: (context) {
            switch (index) {
              case 0:
                return ApodScreen();
                break;
              case 1:
                return SettingsScreen();
                break;
            }
            return ApodScreen();
          },
        );
      },
    );
  }
}
