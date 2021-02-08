import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:spectrum_kids/utility/color_box.dart';

class ClickScreen extends StatefulWidget {
  static const routeName = '/click';

  @override
  _ClickScreenState createState() => _ClickScreenState();
}

class _ClickScreenState extends State<ClickScreen> {

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
        title: Text('FILL IN THE GAP', textAlign: TextAlign.left,
          style: TextStyle(color: ColorBox.primaryColor, fontWeight: FontWeight.w600, fontSize: 22),),
        centerTitle: false,
        elevation: 0,
      ),


      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
            child: Column(
              children: [
                Text('Fill in the gap with the appropriate letter',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),

                SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Text('1.', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 28),),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('M_THER', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40, letterSpacing: 4),),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                  Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Text('2.', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 28),),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('F_THER', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40, letterSpacing: 4),),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Text('3.', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 28),),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('T_ EACHER', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40, letterSpacing: 4),),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Text('4.', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 28),),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('C_ALK', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40, letterSpacing: 4),),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50),

                //The letter options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          border: Border.all(color: Colors.black54)
                      ),
                        child: Center(
                          child: Text('A',
                            style: TextStyle(color: Color(0xffD9583B),
                            fontWeight: FontWeight.w500, fontSize: 35)),
                        ),
                    ),

                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          border: Border.all(color: Colors.black54)
                      ),
                      child: Center(
                        child: Text('H',
                            style: TextStyle(color: Color(0xffD9583B),
                                fontWeight: FontWeight.w500, fontSize: 35)),
                      ),
                    ),

                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          border: Border.all(color: Colors.black54)
                      ),
                      child: Center(
                        child: Text('O',
                            style: TextStyle(color: Color(0xffD9583B),
                                fontWeight: FontWeight.w500, fontSize: 35)),
                      ),
                    ),

                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          border: Border.all(color: Colors.black54)
                      ),
                      child: Center(
                        child: Text('E',
                            style: TextStyle(color: Color(0xffD9583B),
                                fontWeight: FontWeight.w500, fontSize: 35)),
                      ),
                    ),
                  ],
                ),

                Spacer(),

                Row(
                  children: [
                    Icon(Icons.arrow_back_outlined, color: Colors.redAccent,),
                    Spacer(),
                    InkWell(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> ))
                        },
                        child: Icon(Icons.arrow_forward_outlined, color: Colors.redAccent,)),
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
    );
  }


}
