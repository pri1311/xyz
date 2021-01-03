import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  var _selectedTab;
  BottomNavBar(this._selectedTab);
  @override
  _BottomNavBarState createState() => _BottomNavBarState(_selectedTab);
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedTab;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  _BottomNavBarState(this._selectedTab);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Center(
          child: SalomonBottomBar(
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            onTap: _handleIndexChanged,
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white.withOpacity(0.50),
                  size: 30,
                ),
                title: Text("Home"),
                selectedColor: Colors.white,
              ),

              /// Search
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.white.withOpacity(0.60),
                  size: 30,
                ),
                title: Text("Search"),
                selectedColor: Colors.white,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.white.withOpacity(0.50),
                  size: 30,
                ),
                title: Text("Profile"),
                selectedColor: Colors.white,
              ),
            ],
          ),
        ));
  }
}

enum _SelectedTab { home, search, profile }
