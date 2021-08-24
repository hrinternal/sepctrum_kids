import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spectrum_kids/categories/click.dart';
import 'package:spectrum_kids/categories/quiz_result.dart';
import 'package:spectrum_kids/categories/recite.dart';
import 'package:spectrum_kids/model/image_gaps_model.dart';
import 'package:spectrum_kids/model/image_quiz_model.dart';
import '../widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import '../style.dart';

class ImageQuizWidget extends StatefulWidget {
  final Future<List<ImageQuiz>> gapsFuture;
  final Function onQuizEndScreen;

  const ImageQuizWidget(this.gapsFuture, {required this.onQuizEndScreen});

  @override
  _ImageQuizWidgetState createState() {
    return _ImageQuizWidgetState(gapsFuture);
  }
}

class _ImageQuizWidgetState extends State<ImageQuizWidget> {
  Future<List<ImageQuiz>>? _gapsFuture;
  int _selectedQuizIndex = 0;

  _ImageQuizWidgetState(this._gapsFuture);

  @override
  void initState() {
    super.initState();
    // _gapsFuture = widget.gapsFuture;
  }

  void _goToPreviousQuiz() {
    if (_selectedQuizIndex > 0) {
      setState(() {
        _selectedQuizIndex--;
      });
    }
  }

  void _submitHandler(List<ImageQuiz> quizList, ImageQuiz item, String option) {
    ImageGapsModel? itemGap;
    ImageQuizModel? itemQuiz;
    if (item is ImageGapsModel) {
      itemGap = item;
    } else {
      itemQuiz = item as ImageQuizModel;
    }
    var itemAnswer = itemGap?.answer ?? itemQuiz?.answer;
    var itemId = itemGap?.id ?? itemQuiz?.id;
    if (itemAnswer == option) {
      setState(() {
        _gapsFuture = _gapsFuture!.then((value) {
          return value.map((element) {
            var elementId = itemQuiz == null
                ? (element as ImageGapsModel).id
                : (element as ImageQuizModel).id;
            if (itemId == elementId) {
              if (itemQuiz == null) {
                (element as ImageGapsModel).isAnswered = true;
              } else
                (element as ImageQuizModel).isAnswered = true;
            }
            return element;
          }).toList();
        });
        moveNext(quizList);
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(buildInCorrectSnackBar(onSkip: () {
        setState(() {
          moveNext(quizList);
        });
      }));
    }
  }

  void moveNext(List<ImageQuiz> quizList) {
    if (_selectedQuizIndex < quizList.length - 1) {
      _selectedQuizIndex++;
    } else {
      widget.onQuizEndScreen(quizList);
      Get.to(() => QuizResult(quizList));
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("type small is $t");
    // print("type  T is $T");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 28.0, 8.0, 28.0),
        child: FutureBuilder<List<ImageQuiz>>(
            future: _gapsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!;
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 2,
                        pinned: true,
                        collapsedHeight: 70,
                        floating: false,
                        expandedHeight:
                            MediaQuery.of(context).size.height * 0.5 /*390.0*/,
                        title: Center(
                            child: IndexedStack(
                          index: _selectedQuizIndex,
                          children: [
                            ...data.map((e) => Text(
                                  "Level ${_selectedQuizIndex + 1}",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        )),
                        leading: IconButton(
                            icon: Icon(Icons.arrow_back_ios_rounded,
                                color: Colors.black54),
                            onPressed: () => Navigator.pop(context)),
                        actions: [
                          IndexedStack(
                            index: _selectedQuizIndex,
                            children: [
                              ...data.map((item) {
                                ImageGapsModel? itemGap;
                                ImageQuizModel? itemQuiz;
                                // print("type t is $t");
                                if (item is ImageGapsModel) {
                                  itemGap = item;
                                } else {
                                  itemQuiz = item as ImageQuizModel;
                                }
                                var isAnswered =
                                    itemGap?.isAnswered ?? itemQuiz?.isAnswered;
                                var itemAnswer =
                                    itemGap?.answer ?? itemQuiz?.answer;
                                var itemWord = itemGap?.word;
                                var itemWordGap = itemGap?.wordGap;
                                return IconButton(
                                    icon: Icon(
                                      Icons.multitrack_audio_sharp,
                                      color: Colors.black54,
                                    ),
                                    onPressed: () {
                                      recite(isAnswered!
                                          ? (itemWord ?? itemAnswer!)
                                          : (itemWordGap ?? itemAnswer)!);
                                    });
                              }),
                            ],
                          )
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          // titlePadding: const EdgeInsets.only(top:48.0),
                          background: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                gradient: MStyle.mGradientRad(Colors.red),
                                backgroundBlendMode: BlendMode.multiply),
                            child: Flex(
                              direction: Axis.vertical,
                              children: [
                                // SizedBox(height: 93,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 78.0),
                                  child: Expanded(
                                      child: Text("What Object is this?",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54))),
                                ),
                                // SizedBox(height: 13,),
                                Padding(
                                  padding: (data.first is ImageQuizModel)
                                      ? const EdgeInsets.only(
                                          top: 38, bottom: 0.0)
                                      : const EdgeInsets.only(
                                          top: 28, bottom: 10.0),
                                  child: Expanded(
                                      flex: 4,
                                      child: IndexedStack(
                                        index: _selectedQuizIndex,
                                        children: data.map((item) {
                                          ImageGapsModel? itemGap;
                                          ImageQuizModel? itemQuiz;
                                          if (data.first is ImageGapsModel) {
                                            itemGap = item as ImageGapsModel;
                                          } else if (data.first
                                              is ImageQuizModel) {
                                            itemQuiz = item as ImageQuizModel;
                                          } else {
                                            itemGap = item as ImageGapsModel;
                                          }
                                          var image =
                                              itemGap?.image ?? itemQuiz?.image;

                                          return Image.asset(
                                            image!,
                                            width:  (data.first is ImageQuizModel)
                                                ?256:189,
                                            height:  (data.first is ImageQuizModel)
                                                ?256:189,
                                          );
                                        }).toList(),
                                      )),
                                ),
                              ],
                            ),
                          ),

                          title: IndexedStack(
                              index: _selectedQuizIndex,
                              children: data.map((item) {
                                ImageGapsModel? itemGap;
                                ImageQuizModel? itemQuiz;
                                if (item is ImageGapsModel) {
                                  itemGap = item;
                                } else {
                                  itemQuiz = item as ImageQuizModel;
                                }
                                var isAnswered =
                                    itemGap?.isAnswered ?? itemQuiz?.isAnswered;
                                var itemWord = itemGap?.word;
                                var itemWordGap = itemGap?.wordGap;
                                return itemWord == null
                                    ? Container()
                                    : QuizWord(
                                        text: isAnswered!
                                            ? itemWord
                                            : itemWordGap!);
                              }).toList()),
                        )),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: (data.first is ImageQuizModel)
                            ? const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 35)
                            : const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 40),
                        child: IndexedStack(
                            index: _selectedQuizIndex,
                            children: data.map((item) {
                              ImageGapsModel? itemGap;
                              ImageQuizModel? itemQuiz;
                              if (item is ImageGapsModel) {
                                itemGap = item;
                              } else {
                                itemQuiz = item as ImageQuizModel;
                              }
                              var itemIsAnswered =
                                  itemGap?.isAnswered ?? itemQuiz?.isAnswered;
                              var itemAnswer =
                                  itemGap?.answer ?? itemQuiz?.answer;

                              return Center(
                                child: Wrap(
                                  runAlignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  runSpacing: 15,
                                  spacing: 8,
                                  children: [
                                    itemGap?.option1 ?? itemQuiz?.option1,
                                    itemGap?.option2 ?? itemQuiz?.option2,
                                    itemGap?.option3 ?? itemQuiz?.option3,
                                    itemGap?.option4 ?? itemQuiz?.option4,
                                    itemGap?.option5 ?? itemQuiz?.option5,
                                  ].map((String? option) {
                                    var borderRadius = Radius.circular(18);
                                    var isAnswered = itemIsAnswered! &&
                                        itemAnswer == option!;
                                    return Material(
                                      elevation: 2,
                                      color: isAnswered
                                          ? Colors.blue[300]
                                          : Colors.grey[200],
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          color: MStyle.appAccent,
                                        ),
                                        borderRadius:
                                            BorderRadius.all(borderRadius),
                                      ),
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.all(borderRadius),
                                        onTap: () {
                                          _submitHandler(data, item, option!);
                                        },
                                        child: Padding(
                                          padding: (item is ImageQuizModel)
                                              ? const EdgeInsets.symmetric(
                                                  horizontal: 25.0,
                                                  vertical: 20)
                                              : const EdgeInsets.symmetric(
                                                  horizontal: 32.0,
                                                  vertical: 24),
                                          child: Text(option!,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: MStyle.appAccent)),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            }).toList()),
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: RoundedTriButton(
                          text: "Previous",
                          color: MStyle.appAccent,
                          press: () {
                            _goToPreviousQuiz();
                          }),
                    ))
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}

class QuizWord extends StatelessWidget {
  const QuizWord({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: text /*.replaceFirst("_", "...")*/ .characters
          .toList()
          .map((String char) {
        var text = char;
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              // color: char["color"],
              // decorationStyle: isGap ? null : TextDecorationStyle.dotted,
              // decoration: isGap ? null : TextDecoration.underline,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class QuizButton {
  String text;
  Color color;
  bool selected;

  QuizButton(this.text, this.color, this.selected);
}

Future<List<ImageGapsModel>> fetchGapQuiz() async {
  String jsonString =
      await rootBundle.loadString('assets/data/image_gaps.json');

  final jsonParsed = json.decode(jsonString);
  return jsonParsed
      .map<ImageGapsModel>((json) => (ImageGapsModel.fromJson(json)))
      .toList();
}

Future<List<ImageQuizModel>> fetchImageQuiz() async {
  String jsonString =
      await rootBundle.loadString('assets/data/image_quiz.json');

  final jsonParsed = json.decode(jsonString);
  return jsonParsed
      .map<ImageQuizModel>((json) => (ImageQuizModel.fromJson(json)))
      .toList();
}
