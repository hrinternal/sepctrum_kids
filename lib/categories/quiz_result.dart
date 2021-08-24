import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spectrum_kids/model/image_gaps_model.dart';
import 'package:spectrum_kids/model/image_quiz_model.dart';

import '../style.dart';
import '../categories/fill_identify_image.dart';

class QuizResult extends StatefulWidget {
  const QuizResult(this.quizList);

  final List<ImageQuiz> quizList;

  @override
  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 2,
                pinned: true,
                collapsedHeight: 70,
                floating: false,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black54,
                  ),
                  onPressed: () => Get.back(),
                ),
                leadingWidth: 0,
                expandedHeight:
                    MediaQuery.of(context).size.height * 0.7 /*590.0*/,
                title: Center(
                    child: Text(
                  "Excellent!",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Container(
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        // SizedBox(height: 93,),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 78.0),
                            child: Expanded(
                                child: Text("You have got a perfect score!",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54))),
                          ),
                        ),
                        // SizedBox(height: 13,),
                        Expanded(
                          flex: 4,
                          child: Stack(
                            children: [
                              Center(
                                  child: Image.asset("assets/images/ray.png")),
                              Center(
                                  child:
                                      SizedBox(width: 163, child: WinIcon())),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            SliverToBoxAdapter(
                child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Swipe to see all"),
              ),
            )),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              List? gapList = widget.quizList;
              ImageGapsModel? gapQuiz = gapList[index] is ImageGapsModel
                  ? gapList[index] as ImageGapsModel
                  : null;
              ImageQuizModel? imageQuiz = gapList[index] is ImageQuizModel
                  ? gapList[index] as ImageQuizModel
                  : null;
              var isAnswered = (gapQuiz?.isAnswered ?? imageQuiz?.isAnswered)!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          gradient: MStyle.mGradientRad(Colors.red),
                          backgroundBlendMode: BlendMode.multiply),
                      child: ListTile(
                        horizontalTitleGap: 0,
                        contentPadding: EdgeInsets.zero,
                        leading: Image.asset(
                            (gapQuiz?.image ?? imageQuiz?.image)!,
                            width: 24,
                            height: 24),
                        title: QuizWord(text: gapQuiz?.word ?? imageQuiz?.answer??""),
                        trailing: IconButton(
                          icon: Icon(
                              isAnswered ? Icons.check_circle : Icons.cancel),
                          color: isAnswered ? Colors.blue : Colors.deepOrange,
                          onPressed: () {},
                        ),
                      )),
                )),
              );
            }, childCount: widget.quizList.length)),
          ],
        ),
      ),
    );
  }
}

class QuizButton {
  String text;
  Color color;
  bool selected;

  QuizButton(this.text, this.color, this.selected);
}

class WinIcon extends StatelessWidget {
  const WinIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 110,
      // height: 110,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: MStyle.mGradient1(Colors.red),
          backgroundBlendMode: BlendMode.multiply),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Image.asset(
          "assets/images/trophy.png",
        ),
      ),
    );
  }
}
