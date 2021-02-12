import 'dart:convert';
import 'dart:typed_data';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sound/flutter_sound_player.dart';
import 'package:spectrum_kids/model/fruit_model.dart';
import 'package:spectrum_kids/widgets/fruit_tile_card.dart';

Future<List<FruitsEntity>> _fetchFruits() async {
  String jsonString = await rootBundle.loadString('assets/data/fruits.json');
  final jsonParsed =  json.decode(jsonString);

  return jsonParsed.map<FruitsEntity>((json) => new FruitsEntity.fromJson(json)).toList();
}

class ReciteFruitsScreen extends StatefulWidget {
  static const routeName = '/recite-fruits';
  final String title;
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
  Future<List<FruitsEntity>> _fruitsFuture;
  FlutterSoundPlayer _soundPlayer;
  int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _fruitsFuture = _fetchFruits();
    _soundPlayer = new FlutterSoundPlayer();
  }

  void _playAudio(String audioPath) async {
    // Load a local audio file and get it as a buffer
    Uint8List buffer = (await rootBundle.load(audioPath)).buffer.asUint8List();
    await _soundPlayer.startPlayerFromBuffer(buffer);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 40.0),
            child: Text('Tap the fruits and recite.', style: TextStyle(fontSize: 25, color:  Colors.grey[800]),),
          ),

          Expanded(
            child: FutureBuilder(
              future: _fruitsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: index % 2 == 0
                              ? const EdgeInsets.only(bottom: 20, left: 20)
                              : const EdgeInsets.only(bottom: 20, right: 20),
                          child: FruitTileCard(
                            isActive: _selectedIndex == index,
                            image: snapshot.data[index].image,
                            fruitName: snapshot.data[index].text,
                            // textColor: getIndexColor(index),
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                              _playAudio(snapshot.data[index].audio);
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
      );
  }

  @override
  void dispose() {
    _soundPlayer.release();
    super.dispose();
  }
}
