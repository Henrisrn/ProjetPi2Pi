import 'package:flutter/material.dart';

class SwipePage extends StatefulWidget {
  @override
  _SwipePageState createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  String _swipeDirection = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe Page'),
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 0) {
            setState(() {
              _swipeDirection = 'down';
            });
          } else if (details.delta.dy < 0) {
            setState(() {
              _swipeDirection = 'up';
            });
          }
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            _swipeDirection.isNotEmpty
                ? 'You swiped $_swipeDirection'
                : 'Swipe up or down',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
