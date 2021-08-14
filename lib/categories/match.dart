import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spectrum_kids/utility/color_box.dart';

class MatchScreen extends StatefulWidget {
  static const routeName = '/match';

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  /// Map to keep track of score
  final Map<String, bool> score = {};

  /// Choices for game
  final Map choices = {
    '🍏': Colors.green,
    '🍋': Colors.yellow,
    '🍅': Colors.red,
    '🍇': Colors.purple,
    '🥥': Colors.brown,
    '🥕': Colors.orange
  };

  // Random seed to shuffle order of items.
  int seed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white24,
        // leading: Container(),
        title: Center(
          child: Text('MATCH THE FRUITS TO\nTHEIR CORRECT COLORS', textAlign: TextAlign.center,
            style: TextStyle(color: ColorBox.primaryColor, fontWeight: FontWeight.w600, fontSize: 22),),
        ),
        centerTitle: false,
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
                  childWhenDragging: Emoji(emoji: ''),
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
      builder: (BuildContext context, List<String?> incoming, List rejected) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.white,
            child: Text('Correct!', style: TextStyle(fontSize: 23 , letterSpacing: 3, fontWeight: FontWeight.bold)),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
          return Container(color: choices[emoji], height: 80, width: 200);
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
  Emoji({Key? key, this.emoji}) : super(key: key);

  final String? emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 75,
        padding: EdgeInsets.all(10),
        child: Text(emoji!, style: TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
    );
  }
}

// AudioCache plyr = AudioCache();
