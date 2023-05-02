import 'package:flutter/material.dart';

import '../../handlers/icon_handler.dart';
import '../../services/home/pages/home_page.dart';
import '../../services/more/pages/more_page.dart';
import '../../services/my_posts/pages/my_posts_page.dart';
import '../../services/search/pages/search_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _index = 0;
  String _mapIcon(int index, String icon) {
    if (_index == index) return "navigation_icons/${icon}_bold";
    return "navigation_icons/${icon}_outline";
  }

  Color _mapColor(int index, BuildContext context) {
    if (_index == index) return Theme.of(context).bottomNavigationBarTheme.selectedItemColor!;
    return Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!;
  }

  List<Widget> screen = [
    const HomePage(),
    const SearchPage(),
    const MyPostsPage(),
    const MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        onTap: (value) => setState(() {
          _index = value;
        }),
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(icon: drawSvgIcon(_mapIcon(0, "home"), iconColor: _mapColor(0, context)), label: "Home"),
          BottomNavigationBarItem(icon: drawSvgIcon(_mapIcon(1, "search"), iconColor: _mapColor(1, context)), label: "Search"),
          BottomNavigationBarItem(icon: drawSvgIcon(_mapIcon(2, "posts"), iconColor: _mapColor(2, context)), label: "My Posts"),
          BottomNavigationBarItem(icon: drawSvgIcon(_mapIcon(3, "more"), iconColor: _mapColor(3, context)), label: "More"),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: screen[_index],
      ),
    );
  }
}
