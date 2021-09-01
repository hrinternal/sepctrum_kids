import 'package:flutter/material.dart';
import 'package:spectrum_kids/screens/book_details.dart';

class OnlineBookItem extends StatelessWidget {
  const OnlineBookItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  final String book;

  @override
  Widget build(BuildContext context) {
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
  }
}