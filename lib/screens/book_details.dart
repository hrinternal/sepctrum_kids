import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:spectrum_kids/categories/click.dart';
import 'package:spectrum_kids/categories/recite.dart';

class BookDetails extends StatefulWidget {
  static const routeName = '/book-details';

  final List accessCodeBooks;
  BookDetails({this.accessCodeBooks});

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Container(
                      child: Image.asset('assets/images/english3.png', width: 150, height: 200, fit: BoxFit.contain,))),
              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name', style: TextStyle(color: Colors.redAccent, fontSize: 20)),
                    Spacer(),
                    Text('Spectrum New Era 3', style: TextStyle(fontSize: 20),)
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Class', style: TextStyle(color: Colors.redAccent, fontSize: 20)),
                    SizedBox(width: 50),
                    Text('Primary 3', style: TextStyle(fontSize: 20),)
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(70.0, 0.0, 0.0, 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Publisher', style: TextStyle(color: Colors.redAccent, fontSize: 20)),
                    SizedBox(width: 20,),
                    Text('Spectrum Book Publishers', style: TextStyle(fontSize: 20),)
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(70.0, 0.0, 0.0, 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Size', style: TextStyle(color: Colors.redAccent, fontSize: 20)),
                    SizedBox(width: 60,),
                    Text('100mb', style: TextStyle(fontSize: 20),)
                  ],
                ),
              ),
              SizedBox(height: 20),

              InkWell(
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ClickScreen()));

                },
                child: Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                        child: Row(
                          children: [
                            Text('DOWNLOAD', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500,)),
                            Spacer(),
                            Icon(Icons.download_outlined, color: Colors.white, )
                          ],
                        ),
                      ),
                ),
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget title({int index}) {
    switch (index) {
      case 0:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 20,
              color: Colors.white,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Library',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
        break;
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 20,
              color: Colors.white,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Downloads', textAlign: TextAlign.center),
            ),
          ],
        );
        break;
      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 20,
              color: Colors.white,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Notes', textAlign: TextAlign.center),
            ),
          ],
        );
        break;
      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 20,
              color: Colors.white,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Games', textAlign: TextAlign.center),
            ),
          ],
        );
        break;
      default:
        return Text('');
    }
  }
}
