import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BookDetails extends StatefulWidget {
  static const routeName = '/book-details';

  final List? accessCodeBooks;

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
                      child: Image.asset(
                'assets/images/english3.png',
                width: 150,
                height: 200,
                fit: BoxFit.contain,
              ))),
              SizedBox(height: 50),
              ...details.map((item) => Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0.0, 15.0, 15.0),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(item.tittle,
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 20))),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                            flex: 4,
                            child: Text(
                              item.content,
                              style: TextStyle(fontSize: 18),
                            ))
                      ],
                    ),
                  )),
              SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Center(
                    child:TextButton.icon(
                        // onPressed:() => Ge,
                        onPressed:() => Get.snackbar("", "Todo!!"),
                        icon: Icon(Icons.download_rounded,color: Colors.white,),
                        label: Text(
                            "Download", style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ),
            ],
          )),
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

List<DetailsItem> details = [
  DetailsItem("Name", "Spectrum New Era 3"),
  DetailsItem("Class", "Primary 3"),
  DetailsItem("Publisher", "Spectrum Book Publishers"),
  DetailsItem("Size", "100mb"),
];

class DetailsItem {
  String tittle;
  String content;

  DetailsItem(this.tittle, this.content);
}
