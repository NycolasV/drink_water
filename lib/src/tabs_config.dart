import 'package:drink_water/src/pages/add_new_page.dart';
import 'package:drink_water/src/pages/home_page.dart';
import 'package:drink_water/src/pages/list_page.dart';
import 'package:flutter/material.dart';

const String homeRoute = "/";
const String listRoute = "/list";
const String addNewRoute = "/addNew";

class TabRouteItem {
  final String route;
  final String title;
  final Icon icon;
  final Icon activateIcon;

  const TabRouteItem(this.route, this.title, this.icon, this.activateIcon);
}

const List<TabRouteItem> allTabRouteItems = <TabRouteItem>[
  TabRouteItem(homeRoute, 'Home',
      Icon(Icons.home),
      Icon(
        Icons.home,
        color: Colors.blue,
      )),
  TabRouteItem(listRoute, 'List',
      Icon(Icons.list),
      Icon(
        Icons.list,
        color: Colors.blue,
      )),
  TabRouteItem(addNewRoute, 'Add new',
      Icon(Icons.add_alarm),
      Icon(
        Icons.add_alarm,
        color: Colors.blue,
      )),
];

class TabsConfig extends StatefulWidget {
  _TabsConfigState createState() => _TabsConfigState();
}

class _TabsConfigState extends State<TabsConfig> with TickerProviderStateMixin<TabsConfig> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _safeArea(),
      bottomNavigationBar: _navigationBar(),
    );
  }

  Widget _safeArea() {
    return SafeArea(
      top: false,
      child: IndexedStack(
        index: _currentIndex,
        children: allTabRouteItems.map<Widget>((TabRouteItem tab){
          return NavigationView(
            tab: tab,
          );
        }).toList(),
      ),
    );
  }

  Widget _navigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: allTabRouteItems.map((TabRouteItem tab) {
        return BottomNavigationBarItem(
          icon: tab.icon,
          activeIcon: tab.activateIcon,
          title: Text(tab.title),
        );
      }).toList(),
    );
  }
}

class NavigationView extends StatefulWidget {
  final TabRouteItem tab;

  const NavigationView({Key key, this.tab}) : super(key: key);

  @override
  _NavigationView createState() => _NavigationView();
}

class _NavigationView extends State<NavigationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: _getCurrentRoute,
    );
  }

  MaterialPageRoute _getCurrentRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) {
        switch (widget.tab.route) {
          case homeRoute:
            return HomePage();

          case listRoute:
            return ListPage();

          case addNewRoute:
            return AddNewPage();

          default:
            return Scaffold(
              body: Center(
                child: Text('NO PATH PASSED'),
              ),
            );
        }
      },
    );
  }
}
