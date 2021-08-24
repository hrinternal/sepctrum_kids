import 'dart:convert';
import 'dart:typed_data';
import 'dart:async' show Future;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:spectrum_kids/categories/recite.dart';
import 'package:spectrum_kids/model/fruit_model.dart';
import 'package:spectrum_kids/widgets/fruit_tile_card.dart';

Future<List<FruitsEntity>> _fetchFruits() async {
  String jsonString = await rootBundle.loadString('assets/data/fruits.json');
  final jsonParsed = json.decode(jsonString);

  return jsonParsed
      .map<FruitsEntity>((json) => new FruitsEntity.fromJson(json))
      .toList();
}

class ReciteFruitsScreen extends StatefulWidget {
  static const routeName = '/recite-fruits';
  final String? title;

  // final Color primaryColor;
  // final Color secondaryColor;

  ReciteFruitsScreen({
    this.title,
    // this.primaryColor,
    // this.secondaryColor,
  });

  @override
  _ReciteFruitsScreenState createState() => _ReciteFruitsScreenState();
}

class _ReciteFruitsScreenState extends State<ReciteFruitsScreen> {
  late Future<List<FruitsEntity>> _fruitsFuture;
  late FlutterSoundPlayer _soundPlayer;
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();

    _fruitsFuture = _fetchFruits();
    _soundPlayer = new FlutterSoundPlayer();
  }

  void _playAudio(String audioPath, String text) async {
    recite(text);
    // AudioCache player = new AudioCache();
    // player
    //     .play(audioPath.replaceFirst("assets/", ""))
    //     .then((value) => value.onPlayerCompletion.listen((event) {
    //         }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruits"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 40.0),
            child: Text(
              'Tap the fruits and recite.',
              style: TextStyle(fontSize: 25, color: Colors.grey[800]),
            ),
          ),
          Expanded(
            child: FutureBuilder<List>(
              future: _fruitsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                      ),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: index % 2 == 0
                              ? const EdgeInsets.only(bottom: 20, left: 20)
                              : const EdgeInsets.only(bottom: 20, right: 20),
                          child: FruitTileCard(
                            isActive: _selectedIndex == index,
                            image: data[index].image,
                            fruitName: data[index].text,
                            // textColor: getIndexColor(index),
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                              _playAudio(data[index].audio, data[index].text);
                            },
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text('Loading...'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // _soundPlayer.release();
    super.dispose();
  }
}
