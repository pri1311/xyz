import 'dart:ui';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Function _handleIndexChange;
  final String username = "username";
  final String email = "xyz@gmail.com";
  final String phone = "+910000xxxxxx";
  final String name = "User\'s Name";
  final String bio =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
  ProfileScreen(this._handleIndexChange);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF121212),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => _handleIndexChange(0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          'My Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 30,
                          ),
                        ),
                        Icon(
                          Icons.logout,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ],
                    ),
                    Container(
                      height: 275,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double innerWidth = constraints.maxWidth;
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Material(
                                  color: Color(0xFF292929).withOpacity(0.70),
                                  borderRadius: BorderRadius.circular(30.0),
                                  shadowColor: Color(0xFF121212),
                                  elevation: 15,
                                  child: Container(
                                    width: innerWidth,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 100,
                                        ),
                                        Text(
                                          name,
                                          style: TextStyle(
                                            color: Color(0xFFEF7070),
                                            fontFamily: 'Nunito',
                                            fontSize: 37,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "@${username}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Colors.white.withOpacity(0.8),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 100,
                                right: 20,
                                child: Icon(
                                  Icons.edit,
                                  color: Color(0xFFFFFFFF).withOpacity(0.50),
                                  size: 30,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                        fit: BoxFit.contain,
                                        image: new AssetImage(
                                            'assets/images/dp1.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Material(
                      color: Color(0xFF292929).withOpacity(0.70),
                      borderRadius: BorderRadius.circular(30.0),
                      shadowColor: Color(0xFF121212),
                      elevation: 10,
                      child: Container(
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              Text(
                                'Email:',
                                style: TextStyle(
                                  color: Color(0xFFEF7070),
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                email,
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF).withOpacity(0.50),
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Phone:',
                                style: TextStyle(
                                  color: Color(0xFFEF7070),
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                phone,
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF).withOpacity(0.50),
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Bio:',
                                style: TextStyle(
                                  color: Color(0xFFEF7070),
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                bio,
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF).withOpacity(0.50),
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
