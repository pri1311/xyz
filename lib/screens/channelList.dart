import 'package:flutter/material.dart';
import 'package:xyz/screens/widgets.dart';

class channelList extends StatefulWidget {
  @override
  _channelListState createState() => _channelListState();
}

class _channelListState extends State<channelList> {
  List<String> availableChannels = [
    "general",
    "channel",
    "some other channel",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                width: 80,
                decoration: BoxDecoration(
                    color: Color(0xFF292929),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20.0))),
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
                  color: Color(0xFF121212),
                ),
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
                            child: Material(
                              color: Color(0xFF292929).withOpacity(0.70),
                              //borderRadius: BorderRadius.circular(10.0),
                              shadowColor: Color(0xFF121212),
                              elevation: 10,
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  '# ${availableChannels[index]}',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white.withOpacity(0.50)),
                                ),
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
