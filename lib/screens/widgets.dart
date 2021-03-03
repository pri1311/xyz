import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_10.dart';

class Workspacebuttons extends StatelessWidget {
  final String location;
  Function workspaceChange;
  Workspacebuttons({this.workspaceChange, this.location});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: workspaceChange,
      child: Container(
        margin: EdgeInsets.only(
          left: 0.0,
          top: 20.0,
        ),
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: BoxFit.contain,
            image: new AssetImage(location ?? 'assets/images/ws1.jpg'),
          ),
        ),
      ),
    );
  }
}

class messageThread extends StatelessWidget {
  final String name;
  final String image;
  final String message;
  final String imageFilePath;
  messageThread({this.name, this.image, this.message, this.imageFilePath});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Color(0xFF121212),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    image,
                  ),
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width * 0.75,
                child: ChatBubble(
                  backGroundColor: Color(0xFF050505).withOpacity(0.75),
                  clipper: ChatBubbleClipper10(
                    type: BubbleType.receiverBubble,
                  ),
                  child: imageFilePath == null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                color: Color(0xFFEF7070).withOpacity(0.9),
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Text(
                              message,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 15,
                              ),
                            ),
                            Row(
                              children: [
                                LikeButton(
                                  size: 30,
                                ),
                                LikeButton(
                                  size: 30,
                                  circleColor: CircleColor(
                                      start: Color(0xffef7070).withOpacity(0),
                                      end: Color(0xff121212).withOpacity(0)),
                                  bubblesColor: BubblesColor(
                                    dotPrimaryColor:
                                        Color(0xffef7070).withOpacity(0),
                                    dotSecondaryColor:
                                        Color(0xffef7070).withOpacity(0),
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      Icons.celebration,
                                      color: isLiked
                                          ? Color(0xFFEF7070)
                                          : Colors.grey,
                                      size: 30,
                                    );
                                  },
                                  likeCount: 665,
                                  countBuilder:
                                      (int count, bool isLiked, String text) {
                                    var color = isLiked
                                        ? Color(0xFFEF7070)
                                        : Colors.grey;
                                    Widget result;
                                    if (count == 0) {
                                      result = Text(
                                        "love",
                                        style: TextStyle(color: color),
                                      );
                                    } else
                                      result = Text(
                                        text,
                                        style: TextStyle(color: color),
                                      );
                                    return result;
                                  },
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                color: Color(0xFFEF7070).withOpacity(0.9),
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              message,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 15,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              width: width * 0.7,
                              child: Image(
                                image: AssetImage(imageFilePath),
                              ),
                            ),
                            Row(
                              children: [
                                LikeButton(
                                  size: 30,
                                ),
                                LikeButton(
                                  size: 30,
                                  circleColor: CircleColor(
                                      start: Color(0xffef7070).withOpacity(0),
                                      end: Color(0xff121212).withOpacity(0)),
                                  bubblesColor: BubblesColor(
                                    dotPrimaryColor:
                                        Color(0xffef7070).withOpacity(0),
                                    dotSecondaryColor:
                                        Color(0xffef7070).withOpacity(0),
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      Icons.celebration,
                                      color: isLiked
                                          ? Color(0xFFEF7070)
                                          : Colors.grey,
                                      size: 30,
                                    );
                                  },
                                  likeCount: 665,
                                  countBuilder:
                                      (int count, bool isLiked, String text) {
                                    var color = isLiked
                                        ? Color(0xFFEF7070)
                                        : Colors.grey;
                                    Widget result;
                                    if (count == 0) {
                                      result = Text(
                                        "love",
                                        style: TextStyle(color: color),
                                      );
                                    } else
                                      result = Text(
                                        text,
                                        style: TextStyle(color: color),
                                      );
                                    return result;
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
