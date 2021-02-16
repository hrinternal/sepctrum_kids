import 'dart:convert';
import 'dart:typed_data';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sound/flutter_sound_player.dart';
import 'package:spectrum_kids/model/gaps_model.dart';
import 'package:spectrum_kids/widgets/custom_dialog.dart';
import 'package:spectrum_kids/model/fill_alphabets_model.dart';

Future<List<FillAlphabetsModel>> _fetchAlphabets() async {
  String jsonString = await rootBundle.loadString('assets/data/fill_alphabets.json');
  final jsonParsed =  json.decode(jsonString);
  return jsonParsed.map<FillAlphabetsModel>((json) => new FillAlphabetsModel.fromJson(json)).toList();
}

class FillAlphabetsScreen extends StatefulWidget {
  // static const routeName = '/recite-fruits';
  // final String title;
  //
  // FillAlphabetsScreen({this.title,});
  var alphabets = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
  'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];


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
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
          child: Text('Fill in the gap with the appropriate answer.', style: TextStyle(fontSize: 25, color:  Colors.grey[800]),),
        ),

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
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
                          child: Row(
                            children: [
                              Text(snapshot.data[index].letter, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
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
                                        child: Text(snapshot.data[index].option1, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.redAccent)))
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