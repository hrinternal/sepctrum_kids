import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spectrum_kids/categories/click.dart';
import 'package:spectrum_kids/categories/recite.dart';
import 'package:spectrum_kids/model/image_gaps_model.dart';
import 'package:spectrum_kids/widgets/image_quiz_widget.dart';
import '../widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import '../style.dart';
import 'quiz_result.dart';

class FillIdentifyImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ImageQuizWidget(fetchGapQuiz(),
        onQuizEndScreen: (list) {
          print(list.join(","));
        }
    );
  }
  // @override
  // _FillIdentifyImageState createState() => _FillIdentifyImageState();
}

// class _FillIdentifyImageState extends State<FillIdentifyImage> {
//   Future<List<ImageGapsModel>>? _gapsFuture;
//   int _selectedQuizIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _gapsFuture = _fetchGaps();
//   }
//
//   void _goToPreviousQuiz() {
//     if (_selectedQuizIndex > 0) {
//       setState(() {
//         _selectedQuizIndex--;
//       });
//     }
//   }
//
//   void _submitHandler(
//       List<ImageGapsModel> quizList, ImageGapsModel item, String option) {
//     if (item.answer == option) {
//       setState(() {
//         _gapsFuture = _gapsFuture!.then((value) {
//           return value.map((element) {
//             if (item.word == element.word) {
//               element.isAnswered = true;
//             }
//             return element;
//           }).toList();
//         });
//         moveNext(quizList);
//       });
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(buildInCorrectSnackBar(onSkip: () {
//         setState(() {
//           moveNext(quizList);
//         });
//       }));
//     }
//   }
//
//   void moveNext(List<ImageGapsModel> quizList) {
//     if (_selectedQuizIndex < quizList.length - 1) {
//       _selectedQuizIndex++;
//     } else {
//       Get.to(() => QuizResult(quizList));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(8.0, 28.0, 8.0, 28.0),
//         child: FutureBuilder<List<ImageGapsModel>>(
//             future: _gapsFuture,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 var data = snapshot.data!;
//                 return CustomScrollView(
//                   slivers: <Widget>[
//                     SliverAppBar(
//                         backgroundColor: Colors.transparent,
//                         elevation: 2,
//                         pinned: true,
//                         collapsedHeight: 70,
//                         floating: false,
//                         expandedHeight:
//                             MediaQuery.of(context).size.height * 0.5 /*390.0*/,
//                         title: Center(
//                             child: IndexedStack(
//                           index: _selectedQuizIndex,
//                           children: [
//                             ...data.map((e) => Text(
//                                   "Level ${_selectedQuizIndex + 1}",
//                                   style: TextStyle(
//                                       color: Colors.orange,
//                                       fontWeight: FontWeight.bold),
//                                 )),
//                           ],
//                         )),
//                         leading: IconButton(
//                             icon: Icon(Icons.arrow_back_ios_rounded,
//                                 color: Colors.black54),
//                             onPressed: () => Navigator.pop(context)),
//                         actions: [
//                           IndexedStack(
//                             index: _selectedQuizIndex,
//                             children: [
//                               ...data.map((e) => IconButton(
//                                   icon: Icon(
//                                     Icons.multitrack_audio_sharp,
//                                     color: Colors.black54,
//                                   ),
//                                   onPressed: () {
//                                     recite(
//                                         e.isAnswered! ? e.word! : e.wordGap!);
//                                   })),
//                             ],
//                           )
//                         ],
//                         flexibleSpace: FlexibleSpaceBar(
//                           centerTitle: true,
//                           // titlePadding: const EdgeInsets.only(top:48.0),
//                           background: Container(
//                             decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(18)),
//                                 gradient: MStyle.mGradientRad(Colors.red),
//                                 backgroundBlendMode: BlendMode.multiply),
//                             child: Flex(
//                               direction: Axis.vertical,
//                               children: [
//                                 // SizedBox(height: 93,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 78.0),
//                                   child: Expanded(
//                                       child: Text("What Object is this?",
//                                           style: TextStyle(
//                                               fontSize: 16,
//                                               color: Colors.black54))),
//                                 ),
//                                 // SizedBox(height: 13,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 8, bottom: 10.0),
//                                   child: Expanded(
//                                       flex: 4,
//                                       child: IndexedStack(
//                                         index: _selectedQuizIndex,
//                                         children: data
//                                             .map((item) => Image.asset(
//                                                   item.image!,
//                                                   width: 156,
//                                                   height: 156,
//                                                 ))
//                                             .toList(),
//                                       )),
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                           title: IndexedStack(
//                               index: _selectedQuizIndex,
//                               children: data.map((item) {
//                                 return QuizWord(
//                                     text: item.isAnswered!
//                                         ? item.word!
//                                         : item.wordGap!);
//                               }).toList()),
//                         )),
//                     SliverToBoxAdapter(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 18.0, vertical: 33),
//                         child: IndexedStack(
//                             index: _selectedQuizIndex,
//                             children: data.map((item) {
//                               return Center(
//                                 child: Wrap(
//                                   runAlignment: WrapAlignment.center,
//                                   crossAxisAlignment: WrapCrossAlignment.center,
//                                   runSpacing: 15,
//                                   spacing: 8,
//                                   children: [
//                                     item.option1,
//                                     item.option2,
//                                     item.option3,
//                                     item.option4,
//                                     item.option5,
//                                   ].map((String? option) {
//                                     var borderRadius = Radius.circular(18);
//                                     var isAnswered = item.isAnswered! &&
//                                         item.answer == option!;
//                                     return Material(
//                                       elevation: 2,
//                                       color: isAnswered
//                                           ? Colors.blue[300]
//                                           : Colors.grey[200],
//                                       shape: RoundedRectangleBorder(
//                                         side: BorderSide(
//                                           width: 1,
//                                           color: MStyle.appAccent,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.all(borderRadius),
//                                       ),
//                                       child: InkWell(
//                                         borderRadius:
//                                             BorderRadius.all(borderRadius),
//                                         onTap: () {
//                                           _submitHandler(data, item, option!);
//                                         },
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 32.0, vertical: 26),
//                                           child: Text(option!,
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   fontWeight: FontWeight.w700,
//                                                   color: MStyle.appAccent)),
//                                         ),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                               );
//                             }).toList()),
//                       ),
//                     ),
//                     SliverToBoxAdapter(
//                         child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 28.0),
//                       child: RoundedTriButton(
//                           text: "Previous",
//                           color: Colors.redAccent,
//                           press: () {
//                             _goToPreviousQuiz();
//                           }),
//                     ))
//                   ],
//                 );
//               } else {
//                 return Center(child: CircularProgressIndicator());
//               }
//             }),
//       ),
//     );
//   }
// }

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

Future<List<ImageGapsModel>> _fetchGaps() async {
  String jsonString =
      await rootBundle.loadString('assets/data/image_gaps.json');

  final jsonParsed = json.decode(jsonString);
  return jsonParsed
      .map<ImageGapsModel>((json) => new ImageGapsModel.fromJson(json))
      .toList();
}
