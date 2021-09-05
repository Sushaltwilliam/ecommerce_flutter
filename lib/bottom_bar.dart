import 'package:ecommerce/const/my_app_icons.dart';
import 'package:ecommerce/screen/cart_screen.dart';
import 'package:ecommerce/screen/feed_screen.dart';
import 'package:ecommerce/screen/home_screen.dart';
import 'package:ecommerce/screen/search.dart';
import 'package:ecommerce/screen/user_screen.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  // For this we have to assign the appBar in All Page
  // List _pages = [
  //   HomeScreen(),
  //   FeedScreen(),
  //   SearchScreen(),
  //   CartScreen(),
  //   UserScreen(),
  // ];

// if we use map we can assign the appBar etc use in bottomAppBar Screen,

  late List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    _pages = [
      {'page': HomeScreen(), 'title': 'Home'},
      {'page': FeedScreen(), 'title': 'Feed'},
      {'page': SearchScreen(), 'title': 'Search'},
      {'page': CartScreen(), 'title': 'Cart'},
      {'page': UserScreen(), 'title': 'User'},
    ];
    super.initState();
  }

  int _currentIndex = 0;

  void selectedPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(_pages[_currentIndex]['title']),
      // ),
      body: _pages[_currentIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 4,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.purple))),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: selectedPage,
            // unselectedFontSize: 12,
            // selectedFontSize: 15,
            // selectedLabelStyle: Theme.of(context).textTheme.bodyText1,
            backgroundColor: Colors.white,
            unselectedItemColor: Theme.of(context).accentColor,
            selectedItemColor: Theme.of(context).accentColor,
            unselectedIconTheme: Theme.of(context).iconTheme,
            selectedIconTheme: Theme.of(context).iconTheme,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.home),
                  title: Text(
                    'Home',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.rss),
                  title: Text(
                    'Feeds',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(null),
                  title: Text(
                    'Search',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.cart),
                  title: Text(
                    'Cart',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    MyAppIcons.user,
                  ),
                  title: Text(
                    'Profile',
                    style: Theme.of(context).textTheme.bodyText1,
                  ))
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        hoverElevation: 2,
        backgroundColor: _currentIndex == 2 ? Colors.purple : Colors.white,
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        child: Icon(
          MyAppIcons.search,
          color: _currentIndex == 2 ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
