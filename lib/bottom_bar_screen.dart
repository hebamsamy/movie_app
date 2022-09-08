import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/List_screen.dart';
import 'package:movie_app/fliter_screen.dart';
import 'package:movie_app/home_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selected = 0;
  List<Widget> Screens = [HomeScreen(), HomeScreen(), FilterScreen()];
  List<String> titles = ["See Movie", "Explore", "Search"];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(titles[selected]),
          bottom: (selected == 1)
              ? TabBar(indicatorColor: Colors.grey, isScrollable: true, tabs: [
                  Tab(
                    child: Text("Populer"),
                  ),
                  Tab(
                    child: Text("Now Playing"),
                  ),
                  Tab(
                    child: Text("Top Rated"),
                  ),
                  Tab(
                    child: Text("Upcoming"),
                  ),
                ])
              : null,
        ),
        body: (selected == 1)
            ? TabBarView(
                children: [
                  ListScreen(topic: "popular"),
                  ListScreen(topic: "now_playing"),
                  ListScreen(topic: "top_rated"),
                  ListScreen(topic: "upcoming"),
                ],
              )
            : Screens[selected],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selected = value;
            });
          },
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color.fromARGB(255, 196, 129, 124),
          currentIndex: selected,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "List",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Filter",
            ),
          ],
        ),
        drawer: Drawer(
          child: SafeArea(
            child: Container(
              child: Text('Drawer'),
            ),
          ),
        ),
      ),
    );
  }
}
