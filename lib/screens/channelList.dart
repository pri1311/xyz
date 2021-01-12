import 'package:flutter/material.dart';
import 'package:xyz/screens/appDrawer.dart';
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
  AppBar appBar = AppBar(
    backgroundColor: Color(0xFF292929),
    title: Text('#general'),
    leading: Builder(
      builder: (BuildContext appBarContext) {
        return IconButton(
            onPressed: () {
              AppDrawer.of(appBarContext).toggle();
            },
            icon: Icon(Icons.menu));
      },
    ),
  );

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
                          onPressed: null,
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
                                MaterialPageRoute(
                                  builder: (context) => AppDrawer(
                                    child: channelPage(appBar),
                                  ),
                                ),
                              );
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
