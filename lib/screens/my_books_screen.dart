import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:spectrum_kids/utility/color_box.dart';


class MyBooksScreen extends StatefulWidget {
  static const routeName = '/my-books';

  final List? accessCodeBooks;
  MyBooksScreen({this.accessCodeBooks});

  @override
  _MyBooksScreenState createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends State<MyBooksScreen> {
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
            children: [
              Container(
                  // for search
              child: Container(
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
              ),

              Padding(
                padding: const EdgeInsets.only(top: 310.0),
                child: Center(
                    child: Text('You have not added any book yet...',
                        style: TextStyle(fontSize: 20, color: Colors.grey[700]), textAlign: TextAlign.center)
                ),
              ),

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
