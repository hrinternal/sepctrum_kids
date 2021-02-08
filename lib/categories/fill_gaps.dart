import 'dart:isolate';
import 'dart:math';
import 'package:flutter/material.dart';

class FillGapScreen extends StatefulWidget {
  static const routeName = '/fill-gap';

  @override
  _FillGapScreenState createState() => _FillGapScreenState();
}

class _FillGapScreenState extends State<FillGapScreen> {

  /// Map to keep track of score
  final Map<String, bool> score = {};

  /// Choices for game
  final Map choices = {
    '🍏': 'APPLE',
    // '🍋': 'Banana',
    '🍇': 'GRAPE',
    '🥥': 'COCONUT',
    '🥕': 'CARROT'
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: Column(
          children: [
            //for instruction
            Center(
                child: Text('Fill in the gaps with the appropriate letter.',
                    style: TextStyle(fontSize: 22, color: Colors.grey[800]), textAlign: TextAlign.center)
            ),

            //for fruits
            Expanded(
              flex: 2,
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  children: choices.keys.map((emoji) {
                    return Draggable<String>(
                      data: emoji,
                      child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                      feedback: Emoji(emoji: emoji),
                      childWhenDragging: Emoji(emoji: '🌱'),
                    );
                  }).toList()
              ),
            ),

            // for the fruits
            // Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: choices.keys.map((emoji) {
            //       return Draggable<String>(
            //         data: emoji,
            //         child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
            //         feedback: Emoji(emoji: emoji),
            //         childWhenDragging: Emoji(emoji: '🌱'),
            //       );
            //     }).toList()
            // ),

            //for the fruits name
            //for fruit names
            Expanded(

              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                children: choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()..shuffle(Random(seed)),

              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (score[emoji] == true) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey)
            ),
            child: Text('Correct!',
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 20)),
            alignment: Alignment.center,
            // width: 50,
          );
        } else {
          // return Container(color: choices[emoji], height: 80, width: 200,
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.black54)
            ),
            child: Center(
                child: Text(choices[emoji],
                  style: TextStyle(color: Color(0xffD9583B), fontWeight: FontWeight.w500, fontSize: 25),)),
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
        // padding: EdgeInsets.all(10),
        child: Text(emoji, style: TextStyle(color: Colors.black, fontSize: 100),
        ),
      ),
    );
  }
}

// AudioCache plyr = AudioCache();

