import './home/article_page.dart';
import './home/dict_page.dart';
import './home/gallery_page.dart';
import './home/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _bottomNavIndex,
      keepPage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildPageView = PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _bottomNavIndex = index;
        });
      },
      children: <Widget>[
        ArticlePage(),
        GalleryPage(),
        DictPage(),
        ProfilePage(),
      ],
    );

    List<BottomNavigationBarItem> _bottomNavBarItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.public),
        label: 'Article',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.photo_album),
        label: 'Gallery',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        label: 'Dictionary',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];

    return Scaffold(
      body: _buildPageView,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            _pageController.jumpToPage(_bottomNavIndex);
          });
        },
      ),
    );
  }
}
