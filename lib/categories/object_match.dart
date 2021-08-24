import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemMatch extends StatelessWidget {
  const ItemMatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObjectMatch(
        title: "Item Match",
        subTitle: "Drag the items to their corrent name.",
        choices: {
          'assets/images/cat.png': 'CAT',
          'assets/images/hen.png': 'HEN',
          'assets/images/cap.png': 'CAP',
          'assets/images/cup.png': 'CUP',

          // '🍏': 'APPLE',
          // '🍋': 'Banana',
          // '🍇': 'GRAPE',
          // '🥥': 'COCONUT',
          // '🥕': 'CARROT'
        });
  }
}

class ObjectMatch extends StatefulWidget {
  static const routeName = '/drag-drop';
  final Map choices;
  final String title;
  final String subTitle;

  const ObjectMatch(
      {required this.choices, required this.title, required this.subTitle});

  @override
  _ObjectMatchState createState() => _ObjectMatchState(choices);
}

class _ObjectMatchState extends State<ObjectMatch> {
  /// Map to keep track of score
  final Map<String, bool> score = {};

  /// Choices for game
  final Map choices;

  _ObjectMatchState(this.choices); // Random seed to shuffle order of items.
  int seed = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Drag and Drop"),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        child: Flex(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  direction: Axis.vertical,
                  children: [
                    IconButton(
                        alignment: Alignment.centerLeft,
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context)),
                    SizedBox(height: 8),
                    Text(widget.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 26)),
                    SizedBox(height: 10),

                    Text(widget.subTitle,
                        style: TextStyle(fontSize: 18, color: Colors.black45)),
                    SizedBox(height: 20),
                    Expanded(
                      flex: 4,
                      child: Flex(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          // shrinkWrap: true,
                          // crossAxisCount: 2,
                          // childAspectRatio: 1,
                          // crossAxisSpacing: 20.0,
                          // mainAxisSpacing: 20.0,
                          direction: Axis.vertical,
                          children: choices.keys.map((emoji) {
                            return Draggable<String>(
                              data: emoji,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Emoji(
                                      emoji: score[emoji] == true
                                          ? 'assets/images/correct_mark.png'
                                          : emoji),
                                ),
                              ),
                              feedback: Emoji(emoji: emoji),
                              childWhenDragging:
                                  Container(color: Colors.blue[50]),
                            );
                          }).toList()),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.pink[50],
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  // shrinkWrap: true,
                  // crossAxisCount: 2,
                  // childAspectRatio: 2,
                  // crossAxisSpacing: 20.0,
                  // mainAxisSpacing: 20.0,
                  direction: Axis.vertical,
                  children: choices.keys
                      .map((emoji) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 48.0),
                            child: _buildDragTarget(emoji),
                          ))
                      .toList()
                        ..shuffle(Random(seed)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String?> incoming, List rejected) {
        if (score[emoji] == true) {
          return Container(
            // decoration: BoxDecoration(
            //     color: Colors.white, border: Border.all(color: Colors.grey)),
            child: Text('Correct!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 20)),
            alignment: Alignment.center,
            // width: 50,
          );
        } else {
          return Container(
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(0.0),
            //     border: Border.all(color: Colors.black54)
            // ),
            child: Center(
                child: Text(
              choices[emoji],
              style: TextStyle(
                  color: Color(0xff232020),
                  fontWeight: FontWeight.w500,
                  fontSize: 25),
            )),
          );
        }
      },
      onWillAccept: (data) {
        print("$data onWillAccept");
        return data == emoji;
      },
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
        // padding: EdgeInsets.all(10),
        child: Image.asset(
          emoji!, width: 120, height: 120,
          // style: TextStyle(color: Colors.black, fontSize: 100),
        ),
      ),
    );
  }
}

// AudioCache plyr = AudioCache();
