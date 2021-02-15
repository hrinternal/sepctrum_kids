import 'package:flutter/material.dart';
import 'package:spectrum_kids/model/gaps_model.dart';

class AnotherClickTileCard extends StatefulWidget {
  final bool isEnabled;
  final bool isAnswered;
  final String word;
  final String wordGap;
  final String option1;
  final String option2;
  final String answer;
  final VoidCallback onTap;

  const AnotherClickTileCard({Key key, this.isEnabled = true, this.isAnswered = false,
    this.word, this.wordGap, this.option1,
    this.option2, this.answer, this.onTap, title,}) : super(key: key);

  @override
  _AnotherClickTileCardState createState() => _AnotherClickTileCardState();
}

class _AnotherClickTileCardState extends State<AnotherClickTileCard> {
  List<GapsModel> gapsModel;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
        child: Row(
          children: [
            Text(widget.wordGap, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 8)),
            Spacer(),

            InkWell(
              onTap: (){
                if (gapsModel.option1 == widget.answer){
                  setState(() {
                    gapsModel.wordGap = gapsModel.word;
                    gapsModel.isAnswered = true;
                  });
                }
              },
              child: Container(
                  height: 50, width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Center(
                      child: Text(widget.option1, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.redAccent)))
              ),
            ),

            SizedBox(width: 30),

            InkWell(
              onTap: (){
                if (widget.option1 == widget.answer){
                }
              },
              child: Container(
                  height: 50, width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Center(
                      child: Text(widget.option2, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.redAccent))
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
