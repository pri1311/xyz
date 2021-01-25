import 'package:flutter/material.dart';
import 'package:xyz/components/items.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Widget> slides = items
      .map(
        (item) => Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Image.asset(
                  item['image'],
                  fit: BoxFit.fitWidth,
                  width: 220.0,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(item['header'],
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFFE47070),
                              height: 2.0)),
                      Text(
                        item['description'],
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1.2,
                            fontSize: 16.0,
                            height: 1.3),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
      .toList();

  double currentPage = 0.0;
  final _pageViewController = new PageController();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
      (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? Color(0xFFE47070)
                    : Color(0xFFE47070).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0)),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('XYZ'),
        leading: Container(
          child: Image.asset('assets/images/logo.png'),
        ),
        backgroundColor: Colors.black,
        elevation: 50.0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Flexible(
                flex: 6,
                child: PageView.builder(
                  controller: _pageViewController,
                  itemCount: slides.length,
                  itemBuilder: (BuildContext context, int index) {
                    _pageViewController.addListener(() {
                      setState(() {
                        currentPage = _pageViewController.page;
                      });
                    });
                    return slides[index];
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(bottom: 80.0),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: indicator(),
                        ),
                      )),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color(0xFFE47070),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: button(
                        text: 'Log in',
                        colour: Color(0xFFE47070),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/login",
                          );
                          //Navigator.pushNamed(context, LoginPage.id);
                        },
                      )),
                  Expanded(
                    flex: 1,
                    child: button(
                      text: 'Sign up',
                      colour: Color(0xFFE47070),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/register",
                        );
                        //Navigator.pushNamed(context, Registeration.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color colour;

  button({this.text, this.onPressed, this.colour});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 70.0,
      child: RaisedButton(
          child: Text(
            '$text',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          color: colour,
          onPressed: onPressed),
    );
  }
}
