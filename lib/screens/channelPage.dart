import 'package:flutter/material.dart';
import 'package:xyz/screens/widgets.dart';

class channelPage extends StatelessWidget {
  final AppBar appBar;
  channelPage(this.appBar);
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Color(0xFF292929),
                ),
                height: 60,
                child: appBar),
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
                        child: messageData[index]['imageMessagePath'] is Null
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
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.7)),
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
