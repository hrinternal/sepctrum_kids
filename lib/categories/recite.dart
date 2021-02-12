import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:spectrum_kids/categories/recite_along.dart';
import 'package:spectrum_kids/utility/color_box.dart';
import 'package:spectrum_kids/categories/drag_and_drop.dart';

class ReciteScreen extends StatefulWidget {
  static const routeName = '/recite';

  @override
  _ReciteScreenState createState() => _ReciteScreenState();
}

class _ReciteScreenState extends State<ReciteScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white24,
        leading: Container(),
        title: Text('NURSERY RHYMES', textAlign: TextAlign.left,
          style: TextStyle(color: ColorBox.primaryColor, fontWeight: FontWeight.w600, fontSize: 22),),
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
                     child: Text('NIGERIA IS MY COUNTRY', textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                          color: Colors.redAccent, fontWeight: FontWeight.w600, fontSize: 22)
                     ),
                   ),
                  Text('Read and recite aloud',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),

                  SizedBox(height: 50),

                  Text('Nigeria is my country, \nA place of joy\nA place of pleasure\nWhere daddy was born,\nWhere mummy was born,\nNo matter what happens,\nNigeria remains my country.',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),),

                  SizedBox(height: 50),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DragDropScreen()));
                    },
                      child: Image.asset("assets/images/play_button.png")
                  ),

                  Spacer(),

                  Row(
                    children: [
                      Icon(Icons.arrow_back_outlined, color: Colors.redAccent,),
                      Spacer(),
                      Icon(Icons.arrow_forward_outlined, color: Colors.redAccent,),
                    ],
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Text('Spectrum New Era English Book 3',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
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
