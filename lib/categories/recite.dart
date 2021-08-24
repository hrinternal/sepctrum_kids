import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:spectrum_kids/utility/color_box.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ReciteScreen extends StatefulWidget {
  static const routeName = '/recite';

  @override
  _ReciteScreenState createState() => _ReciteScreenState();
}

class _ReciteScreenState extends State<ReciteScreen> {
  var _currentSound = "assets/images/play_button.png";
  var _playSound = "assets/images/play_button.png";
  var  _pauseSound = "assets/images/pause_button.png";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var anthem = 'Nigeria is my country, \nA place of joy\nA place of pleasure\nWhere daddy was born,\nWhere mummy was born,\nNo matter what happens,\nNigeria remains my country.';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white24,
        leading: Container(),
        title: Text(
          'NURSERY RHYMES',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: ColorBox.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 22),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/nigerian_flag.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 20.0),
              child: Column(
                children: [
                  Center(
                    child: Text('NIGERIA IS MY COUNTRY',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 22)),
                  ),
                  Text(
                    'Read and recite aloud',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 50),
                  Text(
                    anthem,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
                  ),
                  SizedBox(height: 50),
                  InkWell(
                      onTap: () async {
                        await recite(anthem);
                          // setState(() => ttsState = TtsState.playing);
                      },
                      child: Image.asset(_currentSound)),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.redAccent,
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Spectrum New Era English Book 3',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
Future<void> recite(String anthem) async {
FlutterTts flutterTts = FlutterTts();
// flutterTts.setStartHandler(() {
//   setState(() {
//     _currentSound=_pauseSound;
//   });
// });
//
// flutterTts.setCompletionHandler(() {
//   setState(() {
//     _currentSound=_playSound;
//   });
// });
await flutterTts.setLanguage("en-GB");
await flutterTts.setSpeechRate(0.4);
// await flutterTts.setVolume(1.0);
// await flutterTts.setPitch(1.0);
// await flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
// if (ttsState == TtsState.playing) {
//   var result = await flutterTts.stop();
//   if (result == 1)
//     setState(() => ttsState = TtsState.stopped);
// }
var result = await flutterTts.speak(anthem);
if (result == 1)
print("Speech begins...");
// setState(() => ttsState = TtsState.playing);
}
