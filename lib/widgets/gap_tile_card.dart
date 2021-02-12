import 'package:flutter/material.dart';
import 'package:spectrum_kids/utility/constant.dart';
import 'package:spectrum_kids/categories/drag_and_drop.dart';
import 'package:spectrum_kids/categories/recite_along.dart';
import 'package:spectrum_kids/model/gaps_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class GapTileCard extends StatefulWidget {

  // final GapsEntity gapsEntity;

  final bool isEnabled;
  final bool isAnswered;
  final String word;
  final String wordGaps;
  final String option1;
  final String option2;
  final String answer;
  final Color textColor;
  final Color backgroundColor;
  final double fontSizeBase;
  final double fontSizeActive;
  final VoidCallback onTap;
  final bool isActive;

  const GapTileCard({
    Key key,
    this.isActive = false, this.isEnabled = true, this.isAnswered = false, this.word, this.wordGaps, this.option2, this.option1, this.answer,
    this.textColor = kTitleTextColor, this.backgroundColor = Colors.white, this.fontSizeBase = 25, this.fontSizeActive = 30,
    this.onTap,  title}) : super(key: key);

  @override
  _GapTileCardState createState() => _GapTileCardState();

}

class _GapTileCardState extends State<GapTileCard> {
  int _selectedIndex;
  // List<GapsEntity> gapsEntity = List<GapsEntity>();
  // GapTileCard gapTileCard = GapTileCard();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey), top: BorderSide(width: 1.0, color: Colors.grey))
      // ),
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
          child: Row(
            children: [
              Text(widget.wordGaps, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 8),),
              Spacer(),

              InkWell(
                // onTap: (){
                //   if(widget.option1 == widget.answer){
                //     setState(() {
                //       wordGaps = widget.word;
                //       widget.isAnswered = true;
                //     });
                //
                //   }
                // },
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
                // onTap: (){
                //   if(widget.gapsEntity.option1 == widget.gapsEntity.answer){
                //     setState(() {
                //       widget.gapsEntity.wordGapp = widget.gapsEntity.word;
                //       widget.gapsEntity.isAnswered = true;
                //     });
                //
                //   }
                // },
                child: Container(
                    height: 50, width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                    ),
                    child: Center(
                        child: Text(widget.option2, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.redAccent)))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
