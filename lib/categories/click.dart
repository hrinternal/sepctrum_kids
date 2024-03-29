import 'dart:convert';
import 'dart:typed_data';
import 'dart:async' show Future;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sound/flutter_sound.dart';
import 'package:spectrum_kids/model/gaps_model.dart';
import 'package:spectrum_kids/widgets/custom_dialog.dart';

// import 'package:';
Future<List<GapsModel>> _fetchGaps() async {
  String jsonString = await rootBundle.loadString('assets/data/gaps.json');
  final jsonParsed = json.decode(jsonString);
  return jsonParsed
      .map<GapsModel>((json) => new GapsModel.fromJson(json))
      .toList();
}

class ClickScreen extends StatefulWidget {
  // static const routeName = '/recite-fruits';
  final String? title;

  ClickScreen({
    this.title,
  });

  @override
  _ClickScreenState createState() => _ClickScreenState();
}

class _ClickScreenState extends State<ClickScreen> {
  Future<List<GapsModel>>? _gapsFuture;
  FlutterSoundPlayer? _soundPlayer;
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _gapsFuture = _fetchGaps();
    _soundPlayer = new FlutterSoundPlayer();
  }

  void _playAudio(String audioPath) async {
    // Load a local audio file and get it as a buffer
    // Uint8List buffer = (await rootBundle.load(audioPath)).buffer.asUint8List();
    // await _soundPlayer?.startPlayerFromBuffer(buffer);
    // await _soundPlayer?.startPlayer(fromDataBuffer:buffer);
    AudioCache player = new AudioCache();
    player.play(audioPath.replaceFirst("assets/", ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill Gaps"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
            child: Center(
                child: Text(
              'Fill in the gap with the correct answer.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: Colors.grey[800]),
            )),
          ),
          Expanded(
            child: FutureBuilder<List>(
              future: _gapsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data2 = snapshot.data!;
                        return Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 30.0, 15.0, 30.0),
                            child: Row(
                              children: [
                                Text(data2[index].wordGap,
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 8)),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    List data = data2;
                                    if (data[index].option1 ==
                                        data[index].answer) {
                                      setState(() {
                                        data[index].wordGap = data[index].word;
                                        data[index].isAnswered = true;
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              buildInCorrectSnackBar());
                                    }
                                  },
                                  child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                      ),
                                      child: Center(
                                        child: Text(
                                          data2[index].option1,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.redAccent),
                                        ),
                                      )),
                                ),
                                SizedBox(width: 30),
                                InkWell(
                                  onTap: () {
                                    if (data2[index].option2 ==
                                        data2[index].answer) {
                                      setState(() {
                                        data2[index].wordGap =
                                            data2[index].word;
                                        data2[index].isAnswered = true;
                                      });
                                    } else {
                                      Scaffold.of(context).showSnackBar(
                                          buildInCorrectSnackBar());
                                    }
                                  },
                                  child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                      ),
                                      child: Center(
                                          child: Text(data2[index].option2,
                                              style: TextStyle(
                                                  fontSize: 50,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.redAccent)))),
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
            onPressed: () {
              showDialog(
                  context: context, builder: (context) => CustomBottomDialog());
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // _soundPlayer?.release();
    super.dispose();
  }
}

SnackBar buildInCorrectSnackBar({Function()? onSkip}) {
  return SnackBar(
    action: onSkip == null
        ? null
        : SnackBarAction(
            label: "Jump",
            onPressed: onSkip,
            textColor: Colors.white70,
          ),
    backgroundColor: Colors.orange.withOpacity(1.0),
    content: Text("INCORRECT, TRY AGAIN",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 3)),
  );
}
