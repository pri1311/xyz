import 'package:flutter/material.dart';

import 'channelPage.dart';

class AppDrawer extends StatefulWidget {
  final Widget child;
  AppDrawer({key, this.child}) : super(key: key);

  static _AppDrawerState of(BuildContext context) =>
      context.findAncestorStateOfType<_AppDrawerState>();

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  static Duration duration = Duration(milliseconds: 300);
  AnimationController _controller;
  static const double maxSlide = 255;
  static const dragRightStartVal = 60;
  static const dragLeftStartVal = maxSlide - 20;
  static bool shouldDrag = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: _AppDrawerState.duration);
    super.initState();
  }

  void close() => _controller.reverse();

  void open() => _controller.forward();

  void toggle() {
    if (_controller.isCompleted) {
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails startDetails) {
    bool isDraggingFromLeft = _controller.isDismissed &&
        startDetails.globalPosition.dx < dragRightStartVal;
    bool isDraggingFromRight = _controller.isCompleted &&
        startDetails.globalPosition.dx > dragLeftStartVal;
    shouldDrag = isDraggingFromLeft || isDraggingFromRight;
  }

  void _onDragUpdate(DragUpdateDetails updateDetails) {
    if (shouldDrag == false) {
      return;
    }
    double delta = updateDetails.primaryDelta / maxSlide;
    _controller.value += delta;
  }

  void _onDragEnd(DragEndDetails dragEndDetails) {
    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }

    double _kMinFlingVelocity = 365.0;
    double dragVelocity = dragEndDetails.velocity.pixelsPerSecond.dx.abs();

    if (dragVelocity >= _kMinFlingVelocity) {
      double visualVelocityInPx = dragEndDetails.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _controller.fling(velocity: visualVelocityInPx);
    } else if (_controller.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          double animationVal = _controller.value;
          double translateVal = animationVal * maxSlide;
          double scaleVal = 1 - (animationVal * 0.3);
          return Stack(
            children: <Widget>[
              CustomDrawer(),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..translate(translateVal)
                  ..scale(scaleVal),
                child: GestureDetector(
                    onTap: () {
                      if (_controller.isCompleted) {
                        close();
                      }
                    },
                    child: widget.child),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  List<String> availableChannels = [
    "general",
    "channel",
    "some other channel",
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
    return Material(
      color: Color(0xFF292929),
      child: SafeArea(
        child: Theme(
          data: ThemeData(
            brightness: Brightness.dark,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Text('Channels',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
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
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '# ${availableChannels[index]}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white.withOpacity(0.60),
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
      ),
    );
  }
}
