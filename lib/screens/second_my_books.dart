import 'dart:ui';
import 'package:flutter/material.dart';

class SecondMyBooks extends StatefulWidget {
  static const routeName = '/second-books';

  final List? accessCodeBooks;
  SecondMyBooks({this.accessCodeBooks});

  @override
  _SecondMyBooksState createState() => _SecondMyBooksState();
}

class _SecondMyBooksState extends State<SecondMyBooks> {
  TextEditingController searchTextController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //for search
              Container(
                height: 50,
                color: Colors.grey[300],
                child: TextField(
                  controller:searchTextController,
                  onSubmitted: (value) {},
                  textInputAction: TextInputAction.go,
                  decoration: new InputDecoration(
                    suffixIcon:FlatButton(
                        color: Colors.transparent,
                        onPressed: () {},
                        child: Container(
                            child:   Icon(Icons.search, color: Color(0xffD9583B))
                        )
                    ) ,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Enter Keyword...",
                    hintStyle: TextStyle( fontSize: 20.0, color: Colors.grey[700], ),
                  ),
                ),
              ),

              SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('ENGLISH', style:TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xffD9583B))),
              ),
              Expanded(
                flex: 2,
                child: Image.asset('assets/images/english3.png'),
              ),

              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('MATHEMATICS', style:TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xffD9583B))),
              ),
              Expanded(
                flex: 2,
                child: Image.asset('assets/images/maths1.png'),
              ),

              SizedBox(height: 30),

              Expanded(
                  flex: 2,
                  child: Container()),

            ],
          )
      ),
    );
  }

  Widget title({int? index}) {
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
