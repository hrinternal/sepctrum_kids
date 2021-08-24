import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:spectrum_kids/utility/color_box.dart';
import 'package:spectrum_kids/screens/book_details.dart';

class LibraryScreen extends StatefulWidget {
  static const routeName = '/library-screen';

  final List? accessCodeBooks;

  LibraryScreen({this.accessCodeBooks});

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
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
              // for search
              Container(
                height: 50,
                color: Colors.grey[300],
                child: TextField(
                  controller: searchTextController,
                  onSubmitted: (value) {},
                  textInputAction: TextInputAction.go,
                  decoration: new InputDecoration(
                    suffixIcon: FlatButton(
                        color: Colors.transparent,
                        onPressed: () {},
                        child: Container(
                            child:
                                Icon(Icons.search, color: Color(0xffD9583B)))),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Enter Keyword...",
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('ENGLISH',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffD9583B))),
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: engBooks.length,
                  itemBuilder: (ctx, index) {
                    var book = engBooks[index];
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(right:4.0),
                        child: Image.asset(book),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookDetails()));
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('MATHEMATICS',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffD9583B))),
              ),Expanded(
                flex: 2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: matBooks.length,
                  itemBuilder: (ctx, index) {
                    var book = matBooks[index];
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(right:4.0),
                        child: Image.asset(book),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookDetails()));
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 30),

              Expanded(flex: 2, child: Container()),
            ],
          )),
    );
  }
}

const List<String> engBooks = <String>[
  'assets/images/english3.png',
  'assets/images/english3.png',
  'assets/images/english3.png',
  'assets/images/english3.png',
  'assets/images/english3.png',
  'assets/images/english3.png',
  'assets/images/english3.png',
];

const List<String> matBooks = <String>[
  'assets/images/maths1.png',
  'assets/images/maths1.png',
  'assets/images/maths1.png',
  'assets/images/maths2.png',
  'assets/images/maths3.png',
  'assets/images/maths3.png',
  'assets/images/maths3.png',
  'assets/images/maths3.png',
];
