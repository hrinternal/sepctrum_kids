import 'dart:convert';
import 'dart:typed_data';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sound/flutter_sound_player.dart';
import 'package:spectrum_kids/widgets/another_click_tile_card.dart';
import 'package:spectrum_kids/model/gaps_model.dart';

Future<List<GapsModel>> _fetchGaps() async {
  String jsonString = await rootBundle.loadString('assets/data/gaps.json');
  final jsonParsed =  json.decode(jsonString);
  return jsonParsed.map<GapsModel>((json) => new GapsModel.fromJson(json)).toList();
}

class AnotherClickScreen extends StatefulWidget {
  // static const routeName = '/recite-fruits';
  final String title;

  AnotherClickScreen({this.title,});

  @override
  _AnotherClickScreenState createState() => _AnotherClickScreenState();
}

class _AnotherClickScreenState extends State<AnotherClickScreen> {
  Future<List<GapsModel>> _gapsFuture;
  FlutterSoundPlayer _soundPlayer;
  int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _gapsFuture = _fetchGaps();
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
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
            child: Text('Fill in the gap with the appropriate answer.', style: TextStyle(fontSize: 25, color:  Colors.grey[800]),),
          ),

          Expanded(
            child: FutureBuilder(
              future: _gapsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnotherClickTileCard(
                          isEnabled: _selectedIndex == index,
                          wordGap: snapshot.data[index].wordGap,
                          option1: snapshot.data[index].option1,
                          option2: snapshot.data[index].option2,
                          // textColor: getIndexColor(index),
                          onTap: () {
                            // setState(() {
                            //   _selectedIndex = index;
                            // });
                            // _playAudio(snapshot.data[index].audio);
                          },
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
