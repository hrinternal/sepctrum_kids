import 'dart:math';
import 'package:flutter/material.dart';

class MatchScreen extends StatefulWidget {
  static const routeName = '/match';

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  final Map<String, bool> score = {};

  /// Choices for game
  final Map choices = {
    '🍏': 'HOE',
    '🍋': 'CUTLASS',
    '🍅': 'BOARD',
    '🍇': 'SHOE',
    // '🥥': Colors.brown,
    // '🥕': Colors.orange
  };

  // Random seed to shuffle order of items.
  int seed = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Center(
              child: Text('Match each picture with the name of the\n object in it.',
                  style: TextStyle(fontSize: 22, color: Colors.grey[800]), textAlign: TextAlign.center)
          ),
          backgroundColor: Colors.white38,
        elevation: 0,
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: choices.keys.map((emoji) {
                return Draggable<String>(
                  data: emoji,
                  child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                  feedback: Emoji(emoji: emoji),
                  childWhenDragging: Emoji(emoji: '🌱'),
                );
              }).toList()
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()..shuffle(Random(seed)),
          )
        ],
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.white,
            child: Text('Correct!'),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
          return Container(
               height: 80, width: 200,
            child: Text( choices[emoji],
              style: TextStyle(color: Color(0xffD9583B), fontWeight: FontWeight.w500, fontSize: 25)),

        );
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
          // plyr.play('success.mp3');
        });
      },
      onLeave: (data) {},
    );
  }
}

class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 75,
        padding: EdgeInsets.all(10),
        child: Text(emoji, style: TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
    );
  }
}
