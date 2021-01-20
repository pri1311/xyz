import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:xyz/screens/widgets.dart';

class ChannelScreen extends StatefulWidget {
  ChannelScreen({Key key}) : super(key: key);

  @override
  _ChannelScreenState createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen>
    with SingleTickerProviderStateMixin {
  FancyDrawerController _controller;

  List<String> availableChannels = [
    "general",
    "channel",
    "some other channel",
  ];

  var messageData = [
    {
      'name': "display name 1",
      'imagepath': "assets/images/dp1.png",
      'imageMessagePath': "assets/images/ws1.jpg",
      'message':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
    },
    {
      'name': "display name 2",
      'imagepath': "assets/images/dp1.png",
      'message':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
    },
    {
      'name': "display name 3",
      'imagepath': "assets/images/dp1.png",
      'message':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
    },
    {
      'name': "display name 1",
      'imagepath': "assets/images/dp1.png",
      'message':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
    },
    {
      'name': "display name 2",
      'imagepath': "assets/images/dp1.png",
      'message':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
    },
    {
      'name': "display name 3",
      'imagepath': "assets/images/dp1.png",
      'message':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FancyDrawerWrapper(
        backgroundColor: Colors.black,
        controller: _controller,
        drawerItems: <Widget>[
          ...availableChannels.map((name) => new channelname(name)).toList(),
        ],
        child: Scaffold(
          backgroundColor: Color(0xFF121212),
          appBar: AppBar(
            elevation: 4.0,
            title: Text(
              "Some appbar",
              style: TextStyle(color: Colors.white.withOpacity(0.7)),
            ),
            backgroundColor: Color(0xFF292929),
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white.withOpacity(0.7),
              ),
              onPressed: () {
                _controller.toggle();
              },
            ),
          ),
          body: Center(
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF121212),
                      ),
                      child: Expanded(
                        child: ListView.separated(
                          itemCount: messageData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: messageData[index]['imageMessagePath']
                                      is Null
                                  ? messageThread(
                                      name: messageData[index]['name'],
                                      image: messageData[index]['imagepath'],
                                      message: messageData[index]['message'],
                                    )
                                  : messageThread(
                                      name: messageData[index]['name'],
                                      image: messageData[index]['imagepath'],
                                      message: messageData[index]['message'],
                                      imageFilePath: messageData[index]
                                          ['imageMessagePath'],
                                    ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Type a message...",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF292929),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.7)),
                                fillColor: Color(0xFFFFFFFF),
                              ),
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              child: Container(
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              child: Container(
                                child: Icon(
                                  Icons.image,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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

class channelname extends StatelessWidget {
  var name;
  channelname(this.name);
  @override
  Widget build(BuildContext context) {
    return Text(
      "${name}",
      style: TextStyle(
        fontSize: 18,
        color: Colors.white.withOpacity(0.7),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
