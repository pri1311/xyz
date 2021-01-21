import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xyz/screens/channelPage.dart';
import 'package:xyz/screens/widgets.dart';

// ignore: camel_case_types
class channelList extends StatefulWidget {
  @override
  _channelListState createState() => _channelListState();
}

// ignore: camel_case_types
class _channelListState extends State<channelList> {
  List<String> availableChannels = [
    "general",
    "channel",
    "some other channel",
  ];

  var workspaces = [
    {
      'id': 1,
      'name': "Workspace1",
      'channels': [
        "general",
        "channel",
        "some other channel",
      ],
    },
    {
      'id': 2,
      'name': "Workspace2",
      'channels': [
        "general",
        "channel",
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XYZ'),
        leading: Container(
          padding: EdgeInsets.all(10),
          child: Image.asset('assets/images/logo.png'),
        ),
        backgroundColor: Color(0xFF121212),
      ),
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                width: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF292929),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Expanded(
                  child: ListView(
                    children: [
                      Workspacebuttons(
                        location: 'assets/images/dp1.png',
                      ),
                      Workspacebuttons(),
                      Workspacebuttons(),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF121212).withOpacity(0.3),
                        ),
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0)),
                              ),
                              builder: (BuildContext context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0)),
                                  ),
                                  padding: EdgeInsets.all(20),
                                  child: Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                          child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          TextField(
                                            autofocus: true,
                                            decoration: InputDecoration(
                                              hintText: "Name of workspace",
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF292929),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.7)),
                                              fillColor: Color(0xFFFFFFFF),
                                            ),
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              hintText: "Admin username",
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF292929),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.7)),
                                              fillColor: Color(0xFFFFFFFF),
                                            ),
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: RaisedButton(
                                              elevation: 6,
                                              focusElevation: 2,
                                              color: Color(0xFFEF7070),
                                              onPressed: () {
                                                print('button pressed!');
                                              },
                                              child: const Text(
                                                'Create Workspace',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))),
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white.withOpacity(0.6),
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: double.infinity,
                //width: 330.0,
                decoration: BoxDecoration(
                  color: Color(0xFF121212),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Workspace name',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF).withOpacity(0.8),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              child: Material(
                                color: Color(0xFF121212).withOpacity(0.70),
                                //borderRadius: BorderRadius.circular(10.0),
                                shadowColor: Color(0xFF121212),
                                elevation: 15,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xFF121212),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                        isScrollControlled: true,
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.0),
                                              topRight: Radius.circular(30.0)),
                                        ),
                                        builder: (BuildContext context) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[900],
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(30.0),
                                                  topRight:
                                                      Radius.circular(30.0)),
                                            ),
                                            padding: EdgeInsets.all(20),
                                            child: Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                    child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    TextField(
                                                      autofocus: true,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            "Name of channel",
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF292929),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.7),
                                                          ),
                                                        ),
                                                        hintStyle: TextStyle(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.7)),
                                                        fillColor:
                                                            Color(0xFFFFFFFF),
                                                      ),
                                                      style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.7),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    TextField(
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            "Admin username",
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF292929),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.7),
                                                          ),
                                                        ),
                                                        hintStyle: TextStyle(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.7)),
                                                        fillColor:
                                                            Color(0xFFFFFFFF),
                                                      ),
                                                      style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.7),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: RaisedButton(
                                                        elevation: 6,
                                                        focusElevation: 2,
                                                        color:
                                                            Color(0xFFEF7070),
                                                        onPressed: () {
                                                          print(
                                                              'button pressed!');
                                                        },
                                                        child: const Text(
                                                          'Create Channel',
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ))),
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Create new channel!',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white.withOpacity(0.60),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
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
                                  PageTransition(
                                      duration: Duration(milliseconds: 500),
                                      type: PageTransitionType.leftToRight,
                                      child: ChannelScreen()));
                            },
                            child: Material(
                              color: Color(0xFF121212).withOpacity(0.70),
                              //borderRadius: BorderRadius.circular(10.0),
                              shadowColor: Color(0xFF121212),
                              elevation: 15,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: const Color(0xFF121212),
                                  ),
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  '# ${availableChannels[index]}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white.withOpacity(0.60),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      ),
                    ),
                  ],
                ),
              ),
            )
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
