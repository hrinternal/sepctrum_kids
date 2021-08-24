import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spectrum_kids/categories/click.dart';
import 'package:spectrum_kids/categories/drag_and_drop.dart';
import 'package:spectrum_kids/categories/fill_alphabets.dart';
import 'package:spectrum_kids/categories/fill_identify_image.dart';
import 'package:spectrum_kids/categories/identify_image.dart';
import 'package:spectrum_kids/categories/match.dart';
import 'package:spectrum_kids/categories/object_match.dart';
import 'package:spectrum_kids/categories/painting.dart';
import 'package:spectrum_kids/categories/recite.dart';
import 'package:spectrum_kids/categories/recite_along.dart';
import 'package:spectrum_kids/categories/recite_colors.dart';
import 'package:spectrum_kids/categories/recite_fruits.dart';
import 'package:spectrum_kids/model/fruit_model.dart';
import 'package:spectrum_kids/utility/constant.dart';
import 'package:spectrum_kids/widgets/fruit_tile_card.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _currentTab = 0;
  var _categories = clickCategories;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tabPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 0);
    var textStyle = TextStyle(fontSize: 18);
    var segIconColor = Colors.grey[700];
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 40.0),
          child: Column(
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 35, color: Colors.grey[900]),
              ),
              SizedBox(height: 8),
              Text(
                'Select any category of your choice',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: MaterialSegmentedControl(
            children: {
              0: Padding(
                  padding: tabPadding,
                  child: Row(children: [
                    Icon(
                      Icons.touch_app_rounded,
                      color: segIconColor,
                    ),
                    SizedBox(width: 4),
                    Text('Click', style: textStyle)
                  ])),
              1: Padding(
                  padding: tabPadding,
                  child: Row(children: [
                    Icon(Icons.multitrack_audio_outlined, color: segIconColor),
                    SizedBox(width: 4),
                    Text('Voice', style: textStyle)
                  ])),
              2: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(children: [
                    Icon(Icons.drag_indicator, color: segIconColor),
                    Text('Gesture', style: textStyle)
                  ])),
              // 3: Padding(padding: tabPadding, child: Text('Voice Game')),
              // 2: Text('Rio'),
            },
            selectionIndex: _currentTab,
            borderColor: Colors.grey[200],
            selectedColor: Colors.redAccent,
            unselectedColor: Colors.grey[100],
            borderRadius: 12.0,
            disabledChildren: [
              3,
            ],
            onSegmentChosen: (int index) {
              setState(() {
                _currentTab = index;
                if (index == 0) {
                  _categories = clickCategories;
                } else if(index==1){
                  _categories = voiceCategories;
                } else {
                  _categories = gestureCategories;
                }
              });
            },
          ),
        ),
        SizedBox(height: 43),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                childAspectRatio: 0.8,
              ),
              itemCount: _categories.length,
              itemBuilder: (BuildContext context, int index) {
                CategoryItem category = _categories[index];
                return Padding(
                  padding: index % 2 == 0
                      ? const EdgeInsets.only(bottom: 20, left: 20)
                      : const EdgeInsets.only(bottom: 20, right: 20),
                  child: CategoryCard(
                    image: category.image,
                    tittle: category.tittle,
                    onTap: () {
                      switch (category.type) {
                        case CategoryType.RHYME:
                          Get.to(() => ReciteScreen());
                          break;
                        case CategoryType.TAP_SPELL_ALPHABET:
                          Get.to(() => ReciteAlongScreen());
                          break;
                        case CategoryType.CLICK_GROUP_WORDS:
                          Get.to(() => ClickScreen());
                          break;
                        case CategoryType.TAP_SPELL_FRUIT:
                          Get.to(() => ReciteFruitsScreen());
                          break;
                        case CategoryType.TRACING:
                          Get.to(() => PaintingScreen());
                          break;
                        case CategoryType.FILL_ALPHABET:
                          Get.to(() => FillAlphabetsScreen());
                          break;
                        case CategoryType.FRUIT_DRAG:
                          Get.to(() => DragDropScreen());
                          break;
                        case CategoryType.COLOR_DRAG:
                          Get.to(() => MatchScreen());
                          break;
                        case CategoryType.ITEM_DRAG:
                          Get.to(()=>ItemMatch());
                          break;
                        case CategoryType.TAP_SPELL_COLOR:
                          Get.to(() => ColorsScreen());
                          break;
                        case CategoryType.CLICK_WORDS:
                          Get.to(() => FillIdentifyImage());
                          break;
                        case CategoryType.IDENTIFY_ITEMS:
                          Get.to(() => IdentifyImageQuiz());
                          break;
                      }
                      // Get.snackbar("", "Clicked!");
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String? image;
  final String? tittle;
  final String? subTittle;
  final Color? textColor;
  final Color? backgroundColor;
  final double? fontSizeBase;
  final double? fontSizeActive;
  final VoidCallback? onTap;

  const CategoryCard({
    Key? key,
    this.image,
    this.tittle,
    this.textColor = kTitleTextColor,
    this.backgroundColor = Colors.white,
    this.fontSizeBase = 25,
    this.fontSizeActive = 30,
    this.onTap,
    title,
    this.subTittle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          ),
        ],
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(18.0),
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  SizedBox(height: 15),
                  Expanded(
                      flex: 5, child: Image.asset(image!, fit: BoxFit.cover)),
                  SizedBox(height: 20),
                  Expanded(
                    flex: 2,
                    child: Text(tittle!,
                        softWrap: false,
                        style: TextStyle(
                            fontSize: 14,
                            color: textColor,
                            fontFamily: 'CabinSketch',
                            fontWeight: FontWeight.w700)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("( ${subTittle ?? "Subtitle goes here"} )",
                        softWrap: false,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            // fontFamily: 'CabinSketch',
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum CategoryType {
  //Drag & DROP
  FRUIT_DRAG,
  COLOR_DRAG,
  ITEM_DRAG,
  TRACING,
  //Voice
  RHYME,
  TAP_SPELL_ALPHABET,
  TAP_SPELL_FRUIT,
  TAP_SPELL_COLOR,
  //Click
  CLICK_GROUP_WORDS,
  CLICK_WORDS,
  IDENTIFY_ITEMS,
  FILL_ALPHABET
}

var clickCategories = [
  CategoryItem("assets/category/alphabet.jpg", "Fill Gaps",
      CategoryType.CLICK_GROUP_WORDS),
  CategoryItem("assets/category/book1.png", "Fill to Identify",
      CategoryType.CLICK_WORDS),
  CategoryItem(
      "assets/category/book2.png", "Fill Alphabet", CategoryType.FILL_ALPHABET),
  CategoryItem("assets/category/settings.png", "Click to Identify",
      CategoryType.IDENTIFY_ITEMS),
];

var gestureCategories = [
  CategoryItem(
      "assets/category/alphabet.jpg", "Fruit Match", CategoryType.FRUIT_DRAG),
  CategoryItem(
      "assets/category/book1.png", "Color Match", CategoryType.COLOR_DRAG),
  CategoryItem(
      "assets/category/book2.png", "Object Match", CategoryType.ITEM_DRAG),
  CategoryItem("assets/category/settings.png", "Tracing & Drawing",
      CategoryType.TRACING),
];

var voiceCategories = [
  CategoryItem(
      "assets/category/alphabet.jpg", "Recite Rhyme", CategoryType.RHYME),
  CategoryItem("assets/category/book1.png", "Spell Fruit",
      CategoryType.TAP_SPELL_FRUIT),
  CategoryItem(
      "assets/category/book2.png", "Recite Alphabet", CategoryType.TAP_SPELL_ALPHABET),
  CategoryItem("assets/category/settings.png", "Master Colors",
      CategoryType.TAP_SPELL_COLOR),
];

class CategoryItem {
  String image;
  String tittle;
  CategoryType type;

  CategoryItem(this.image, this.tittle, this.type);
}
