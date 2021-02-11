import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xyz/screens/channelPage.dart';
import 'package:http/http.dart' as http;
import 'package:xyz/screens/homepage.dart';
import 'package:xyz/screens/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class channelList extends StatefulWidget {
  static const String id = 'channel_list';
  @override
  _channelListState createState() => _channelListState();
}

// ignore: camel_case_types
class _channelListState extends State<channelList> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  Future<void> _savingData() async {
    final validation = _form.currentState.validate();
    if (!validation) {
      return;
    }
    _form.currentState.save();
  }

  List<String> availableChannels = [
    "general",
    "channel",
    "some other channel",
  ];

  List<dynamic> workspaces;
  List<dynamic> channels;
  SharedPreferences logindata;
  String username;

  @override
  void initState() {
    super.initState();
    initial();
    getWorkspace();
    // getChannels();
  }

  bool isNameValid = false;
  String workspace_name;
  String admin_name_w;
  String channel_name;
  String admin_name_c;
  int length;
  int lengthc;
  int wid;

  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        isNameValid = true;
      });
      return false;
    }
    setState(() {
      isNameValid = false;
    });
    return true;
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }

  void getWorkspace() async {
    final url = 'http://10.0.2.2:5000/getWorkspace';
    final response = await http.get(url);
    //print(response.body);
    final decoded = json.decode(response.body) as Map<String, dynamic>;
    //print(decoded);
    setState(() {
      workspaces = decoded['w'];
      wid = workspaces[0]['id'];
      length = workspaces.length;
      print(length);
      print(wid);
      print(workspaces);
      getChannels();
    });
  }

  void getChannels() async {
    print("wid");
    print(wid);
    final url = 'http://10.0.2.2:5000/getChannels/${wid}';
    final response = await http.get(url);
    final decoded = json.decode(response.body) as Map<String, dynamic>;
    setState(() {
      channels = decoded['c'];
      lengthc = channels.length;
      print(channels);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
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
                    child: Column(
                      children: [
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
                                            child: Form(
                                          key: _form,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              TextField(
                                                onChanged: (String value) {
                                                  workspace_name = value;
                                                },
                                                autofocus: true,
                                                decoration: InputDecoration(
                                                  errorText: isNameValid
                                                      ? 'Workspace name cannot be blank!'
                                                      : null,
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
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              TextField(
                                                onChanged: (String value) {
                                                  admin_name_w = value;
                                                },
                                                decoration: InputDecoration(
                                                  hintText: "Admin username",
                                                  errorText: isNameValid
                                                      ? 'Admin name cannot be blank!'
                                                      : null,
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
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: RaisedButton(
                                                  elevation: 6,
                                                  focusElevation: 2,
                                                  color: Color(0xFFEF7070),
                                                  onPressed: () async {
                                                    _savingData();
                                                    final response =
                                                        await http.post(
                                                            'http://10.0.2.2:5000/createWorkspace',
                                                            body: json.encode({
                                                              'name':
                                                                  workspace_name,
                                                              'admin_username':
                                                                  admin_name_w,
                                                            }));

                                                    final decoded = json.decode(
                                                            response.body)
                                                        as Map<String, dynamic>;
                                                    print(decoded);
                                                    final status = json.decode(
                                                            decoded['status'])
                                                        as Map<String, dynamic>;
                                                    print(status);
                                                    setState(() {
                                                      if (status['type'] ==
                                                          'success') {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Homepage(),
                                                            ));
                                                      }
                                                    });
                                                  },
                                                  child: const Text(
                                                    'Create Workspace',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                        Flexible(
                          child: ListView.separated(
                            itemCount: length,
                            itemBuilder: (BuildContext context, int index) {
                              return Workspacebuttons();
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
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
                                              topLeft: Radius.circular(30.0),
                                              topRight: Radius.circular(30.0)),
                                        ),
                                        padding: EdgeInsets.all(20),
                                        child: Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: Container(
                                                child: Column(
                                              //mainAxisSize:
                                              //MainAxisSize.min,
                                              children: <Widget>[
                                                TextField(
                                                  onChanged: (String value) {
                                                    channel_name = value;
                                                  },
                                                  autofocus: true,
                                                  decoration: InputDecoration(
                                                    errorText: isNameValid
                                                        ? 'Channel name cannot be blank!'
                                                        : null,
                                                    hintText: "Name of channel",
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF292929),
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
                                                  onChanged: (String value) {
                                                    admin_name_c = value;
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText: "Admin username",
                                                    errorText: isNameValid
                                                        ? 'Admin name cannot be blank!'
                                                        : null,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF292929),
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
                                                    fillColor:
                                                        Color(0xFFFFFFFF),
                                                  ),
                                                  style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.7),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: RaisedButton(
                                                    elevation: 6,
                                                    focusElevation: 2,
                                                    color: Color(0xFFEF7070),
                                                    onPressed: () async {
                                                      _savingData();
                                                      final response =
                                                          await http.post(
                                                              'http://10.0.2.2:5000/createChannel',
                                                              body:
                                                                  json.encode({
                                                                'name':
                                                                    channel_name,
                                                                'admin_username':
                                                                    admin_name_c,
                                                                'wid': wid,
                                                              }));

                                                      final decoded =
                                                          json.decode(
                                                                  response.body)
                                                              as Map<String,
                                                                  dynamic>;
                                                      print(decoded);
                                                      final status = json
                                                          .decode(decoded[
                                                              'status']) as Map<
                                                          String, dynamic>;
                                                      print(status);
                                                      setState(() {
                                                        if (status['type'] ==
                                                            'success') {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Homepage(),
                                                              ));
                                                        }
                                                      });
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
                          itemCount: lengthc,
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
                                    '# ${channels[index]['name']}',
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
                      )
                    ],
                  ),
                ),
              )
            ],
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
