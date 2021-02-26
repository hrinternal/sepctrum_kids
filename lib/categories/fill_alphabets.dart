import 'dart:convert';
import 'dart:typed_data';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sound/flutter_sound_player.dart';
import 'package:spectrum_kids/model/fill_alphabets_model.dart';

Future<List<FillAlphabetsModel>> _fetchAlphabets() async {
  String jsonString = await rootBundle.loadString('assets/data/fill_alphabets.json');
  final jsonParsed =  json.decode(jsonString);
  return jsonParsed.map<FillAlphabetsModel>((json) => new FillAlphabetsModel.fromJson(json)).toList();
}

class FillAlphabetsScreen extends StatefulWidget {

  @override
  _FillAlphabetsScreenState createState() => _FillAlphabetsScreenState();
}

class _FillAlphabetsScreenState extends State<FillAlphabetsScreen> {
  Future<List<FillAlphabetsModel>> fillAlphabetsModel;
  FlutterSoundPlayer _soundPlayer;
  int _selectedIndex;

  @override
  void initState() {
    super.initState();

    fillAlphabetsModel = _fetchAlphabets();
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
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
          child: Text('Fill in the gap with the appropriate answer.', style: TextStyle(fontSize: 22, color:  Colors.grey[800]),
          textAlign: TextAlign.center),
        ),

        //for the options
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 70,
            decoration: BoxDecoration(border: Border.all(color: Colors.redAccent, width: 3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Draggable(
                      child: Text('S', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                      feedback: Text('S', style: TextStyle(fontSize: 40, color: Colors.blue, fontWeight: FontWeight.bold), ),
                  ),
                  Text('J', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                  Text('H', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                  Text('M', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                  Text('B', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                ],
              )
          ),
        ),

        SizedBox(height: 15),
        Container(height: 2, color: Colors.grey,),
        SizedBox(height: 15,),

        //for the alphabets
        Expanded(
          child: FutureBuilder(
            future: fillAlphabetsModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 5.0,
                    ),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade700)
                          ),
                          child: Center(
                              child: Text(snapshot.data[index].letter, style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center)),
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