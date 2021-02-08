import 'dart:convert';
import 'dart:typed_data';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sound/flutter_sound_player.dart';
import 'package:spectrum_kids/model/alphabet_entity.dart';
import 'package:spectrum_kids/widgets/helper.dart';
import 'package:spectrum_kids/widgets/tile_card.dart';

Future<List<AlphabetEntity>> _fetchAlphabets() async {
  String jsonString = await rootBundle.loadString('assets/data/alphabets.json');
  final jsonParsed =  json.decode(jsonString);

  return jsonParsed.map<AlphabetEntity>((json) => new AlphabetEntity.fromJson(json)).toList();
}

class ReciteAlongScreen extends StatefulWidget {
  static const routeName = '/recite-along';
// just editing for test.. remove when you see
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  ReciteAlongScreen({
    this.title,
    this.primaryColor,
    this.secondaryColor,
  });


  @override
  _ReciteAlongScreenState createState() => _ReciteAlongScreenState();
}

class _ReciteAlongScreenState extends State<ReciteAlongScreen> {
  Future<List<AlphabetEntity>> _alphabetsFuture;
  FlutterSoundPlayer _soundPlayer;
  int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _alphabetsFuture = _fetchAlphabets();
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
            child: Text('Tap the alphabets and recite.', style: TextStyle(fontSize: 25, color:  Colors.grey[800]),),
          ),

          Expanded(
            child: FutureBuilder(
              future: _alphabetsFuture,
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
                          child: TileCard(
                            isActive: _selectedIndex == index,
                            title: snapshot.data[index].text,
                            textColor: getIndexColor(index),
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
