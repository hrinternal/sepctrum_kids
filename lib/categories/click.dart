import 'dart:convert';
import 'dart:typed_data';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sound/flutter_sound_player.dart';
import 'package:spectrum_kids/model/gaps_model.dart';
import 'package:spectrum_kids/widgets/custom_dialog.dart';

Future<List<GapsModel>> _fetchGaps() async {
  String jsonString = await rootBundle.loadString('assets/data/gaps.json');
  final jsonParsed =  json.decode(jsonString);
  return jsonParsed.map<GapsModel>((json) => new GapsModel.fromJson(json)).toList();
}

class ClickScreen extends StatefulWidget {
  // static const routeName = '/recite-fruits';
  final String title;

  ClickScreen({this.title,});

  @override
  _ClickScreenState createState() => _ClickScreenState();
}

class _ClickScreenState extends State<ClickScreen> {
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
          child: Center(child: Text('Fill in the gap with the correct answer.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, color:  Colors.grey[800]),)),
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
                      return Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
                          child: Row(
                            children: [
                              Text(snapshot.data[index].wordGap, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 8)),
                              Spacer(),

                              InkWell(
                                onTap: (){
                                  if (snapshot.data[index].option1 == snapshot.data[index].answer){
                                    setState(() {
                                      snapshot.data[index].wordGap = snapshot.data[index].word;
                                      snapshot.data[index].isAnswered = true;
                                    });
                                  }
                                  else{
                                    Scaffold.of(context).showSnackBar(
                                        SnackBar(backgroundColor: Colors.green.withOpacity(1.0),
                                          content: Text("INCORRECT, TRY AGAIN",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 3)),
                                        )
                                    );
                                  }
                                },
                                child: Container(
                                    height: 50, width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                    ),
                                    child: Center(
                                      child: Text(snapshot.data[index].option1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.redAccent),
                                      ),
                                    )
                                ),
                              ),

                              SizedBox(width: 30),

                              InkWell(
                                onTap: (){
                                  if (snapshot.data[index].option2 == snapshot.data[index].answer){
                                    setState(() {
                                      snapshot.data[index].wordGap = snapshot.data[index].word;
                                      snapshot.data[index].isAnswered = true;
                                    });
                                  }
                                  else {
                                    Scaffold.of(context).showSnackBar(
                                        SnackBar(backgroundColor: Colors.green.withOpacity(1.0),
                                          content: Text("INCORRECT, TRY AGAIN",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 3)),
                                        )
                                    );
                                  }
                                },
                                child: Container(
                                    height: 50, width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                    ),
                                    child: Center(
                                        child: Text(snapshot.data[index].option2, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.redAccent))
                                    )
                                ),
                              ),
                            ],
                          ),
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

           FlatButton(
             child: Text('NEXT'),
             onPressed: (){
              showDialog(context: context,  builder: (context) => CustomBottomDialog()
                 );
              },
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