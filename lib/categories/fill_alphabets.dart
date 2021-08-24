import 'dart:convert';
import 'dart:typed_data';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sound/flutter_sound.dart';
import 'package:spectrum_kids/model/fill_alphabets_model.dart';

Future<List<FillAlphabetsModel>> _fetchAlphabets() async {
  String jsonString =
      await rootBundle.loadString('assets/data/fill_alphabets.json');
  final jsonParsed = json.decode(jsonString);
  return jsonParsed
      .map<FillAlphabetsModel>((json) => new FillAlphabetsModel.fromJson(json))
      .toList();
}

class FillAlphabetsScreen extends StatefulWidget {
  @override
  _FillAlphabetsScreenState createState() => _FillAlphabetsScreenState();
}

class _FillAlphabetsScreenState extends State<FillAlphabetsScreen> {
  Future<List<FillAlphabetsModel>>? _fillAlphabets;
  FlutterSoundPlayer? _soundPlayer;
  String _answer = "";
  bool _allAnswered = false;
  late List _alphabetOptions;

  @override
  void initState() {
    super.initState();
    _fillAlphabets = _fetchAlphabets();
    _alphabetOptions = [
      FillAlphabetsModel(letter: 'S'),
      FillAlphabetsModel(letter: 'J'),
      FillAlphabetsModel(letter: 'H'),
      FillAlphabetsModel(letter: 'M'),
      FillAlphabetsModel(letter: 'B')
    ];
    _soundPlayer = new FlutterSoundPlayer();
  }

  void _onAcceptHandler(List<dynamic> list, FillAlphabetsModel item,
      FillAlphabetsModel acceptedData) {
    setState(() {
      _allAnswered = false;
      var acceptedLetter = acceptedData.letter;
      if (item.answer == acceptedLetter) {
        //accept
        _alphabetOptions
            .removeWhere((option) => acceptedLetter == option.letter);
        if (_alphabetOptions.isEmpty) {
          _allAnswered = true;
        }
        _fillAlphabets = _fillAlphabets!.then((list) {
          return list.map((alphabet) {
            var alphabetAnswer = alphabet.answer;
            if (acceptedLetter == alphabetAnswer) {
              print("$alphabetAnswer alphabet");
              print("$acceptedLetter acceptedLetter");
              alphabet.isAnswered = 1;
              alphabet.selected = 1;
              alphabet.letter = acceptedLetter;
              print("updated alphabet is ${alphabet.letter}");
            }
            return alphabet;
          }).toList();
        });
      } else {
        // Mark wrong
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Fill the Gaps"),
      // ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
              child: Text('Fill Alphabets',
                   style: TextStyle(
                      fontSize: 29,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
              child: Text('Fill in the gap with the appropriate answer.',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  textAlign: TextAlign.center),
            ),

            //for the options
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: SizedBox(
                height: 70,
                child: Material(
                    elevation: 4,
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    // height: 70,
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.redAccent, width: 3)),
                    child: _allAnswered
                        ? Center(
                            child: Text(
                              "Task Complete!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ..._alphabetOptions.map((item) {
                                var letter = item.letter!;
                                return Draggable(
                                  data: item,
                                  child: Text(letter,
                                      style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold)),
                                  feedback: Text(
                                    letter,
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  childWhenDragging: Container(),
                                );
                              }),
                            ],
                          )),
              ),
            ),

            SizedBox(height: 15),
            Container(
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),

            //for the alphabets
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: FutureBuilder<List>(
                  future: _fillAlphabets,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var list = snapshot.data!;
                      return MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 5.0,
                          ),
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            FillAlphabetsModel item = list[index];
                            var letter = item.letter;
                            var isAnswered = item.isAnswered == 1;
                            var isSelected = item.selected == 1;
                            print(item.selected);
                            var borderColor = isSelected
                                ? Colors.black
                                : Colors.green.shade700;
                            var bacColor = isSelected
                                ? Colors.blue.shade100
                                : Colors.transparent;
                            // String alphabet = isAnswered ? letter! : _answer;
                            return DragTarget<FillAlphabetsModel>(
                              onWillAccept: (data) {
                                print("$item item");
                                print("${data?.letter} onWillAccept");
                                _onAcceptHandler(list, item, data!);
                                return data.letter == item.letter;
                              },
                              builder: (BuildContext context,
                                  List<Object?> candidateData,
                                  List<dynamic> rejectedData) {
                                // if (!isAnswered && isSelected) {
                                //   return Text("wrong");
                                // } else {
                                return Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: bacColor,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: borderColor)),
                                    child: Center(
                                        child: Text(letter!,
                                            style: TextStyle(
                                                fontSize: 70,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center)),
                                  ),
                                );
                                // }
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // _soundPlayer?.release();
    super.dispose();
  }
}
