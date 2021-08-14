import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:provider/provider.dart';
import 'package:spectrum_kids/screens/registration.dart';
import 'package:spectrum_kids/utility/color_box.dart';
import 'package:spectrum_kids/utility/text_style.dart';

class CarouselSlider extends StatelessWidget {
  static const length = 3;
  final pageIndexNotifier = ValueNotifier<int>(0);

  final List images = [
    {
      'image': 'assets/images/first_carousel.png',
      'title': 'Get your kids to learn on-the-go',
      'check': false
    },
    {
      'image': 'assets/images/second_carousel.png',
      'title': 'Avoid storing books in your homes with Spectrum',
      'check': true
    },
    {
      'image': 'assets/images/third_carousel.png',
      'title': 'Education, even from far away.',
      'check': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Stack(
            alignment: FractionalOffset.bottomCenter,
            children: <Widget>[
              PageView.builder(
                onPageChanged: (index) => pageIndexNotifier.value = index,
                itemCount: length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.center,
                    child: CarouselCardWithButton(
                      image: images[index]['image'],
                      title: images[index]['title'],
                      check: images[index]['check'],
                    ),
                  );
                },
              ),
              _buildExample1()
            ],
          ),
        ),
      ),
    );
  }

  PageViewIndicator _buildExample1() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.green,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: ColorBox.primaryColor,
        ),
      ),
    );
  }
}

class CarouselCardWithButton extends StatelessWidget {
  final String? image;
  final String? title;
  final bool? check;

  CarouselCardWithButton({this.image, this.title, this.check});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(image!),
        SizedBox(height: 30.0),
        Text(
          title!,
          textAlign: TextAlign.center,
          style: TextStyles.h3style.copyWith(fontSize: 13),
        ),
        SizedBox(height: 50.0),
        check!
            ? FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => GetStartedUI()));
                },
                child: Text(
                  'NEXT',
                  style: TextStyles.h3style
                      .copyWith(fontSize: 13, color: ColorBox.primaryColor),
                ),
              )
            : FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => GetStartedUI()));
                },
                child: Text(
                  'SKIP',
                  style: TextStyle(
                    color: ColorBox.primaryColor,
                  ),
                ),
              ),
      ],
    );
  }
}

class GetStartedUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
            ),
          ),
          Image.asset(
            'assets/images/get_started.png',
            width: 250,
            height: 250,
          ),
          SizedBox(height: 30.0),
          Text(
            'Ready to learn?',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorBox.primaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40.0),
          FlatButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegistrationScreen()));
            },
            child: Text('GET STARTED',
                style: TextStyles.h3style
                    .copyWith(fontSize: 13, color: ColorBox.primaryColor)),
          )
        ],
      ),
    );
  }
}
