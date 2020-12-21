import 'package:flutter/material.dart';
import 'package:xyz/screens/widgets.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> availableChannels = [
    "general",
    "channel",
    "some other channel",
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                width: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF121212),
                ),
                child: Expanded(
                  child: ListView(
                    children: [
                      Workspacebuttons(
                        location: 'assets/images/dp1.png',
                      ),
                      Workspacebuttons(),
                      Workspacebuttons(),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                height: double.infinity,
                width: 330.0,
                decoration: BoxDecoration(
                    color: Color(0xFF292929),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20.0))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Expanded(
                        child: ListView.separated(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: availableChannels.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Screen1(),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xFFA9A9A9).withOpacity(0.30)),
                              padding: EdgeInsets.all(8.0),
                              //color: Colors.amber[colorCodes[index]],
                              child: Text(
                                '# ${availableChannels[index]}',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white.withOpacity(0.50)),
                              ),
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Color(0xFF121212),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.60),
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            label: "Profile",
          )
        ],
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("data"),
      ),
    );
  }
}
