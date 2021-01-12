import 'package:flutter/material.dart';
import 'package:xyz/screens/channelList.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:xyz/screens/profile.dart';
import 'package:xyz/screens/searchPage.dart';

enum _SelectedTab { home, search, profile }

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  List<String> availableChannels = [
    "general",
    "channel",
    "some other channel",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _selectedTab == _SelectedTab.home
              ? Expanded(
                  child: channelList(),
                )
              : _selectedTab == _SelectedTab.profile
                  ? Expanded(
                      child: ProfileScreen(_handleIndexChanged),
                    )
                  : Expanded(
                      child: SearchPage(),
                    ),
          Container(
              decoration: BoxDecoration(
                color: Color(0xFF121212),
              ),
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Center(
                child: SalomonBottomBar(
                  selectedItemColor: Color(0xFFEF7070),
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
                      selectedColor: Color(0xFFDE6F70),
                    ),

                    /// Search
                    SalomonBottomBarItem(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white.withOpacity(0.60),
                        size: 30,
                      ),
                      title: Text("Search"),
                      selectedColor: Color(0xFFDE6F70),
                    ),

                    /// Profile
                    SalomonBottomBarItem(
                      icon: Icon(
                        Icons.person,
                        color: Colors.white.withOpacity(0.50),
                        size: 30,
                      ),
                      title: Text("Profile"),
                      selectedColor: Color(0xFFDE6F70),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  final Function _handleIndexChange;
  Screen1(this._handleIndexChange);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            RaisedButton(
              color: Colors.black,
              child: Text(
                "Go back!",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => _handleIndexChange(0),
            ),
            Text(
              "Search",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      )),
    );
  }
}
