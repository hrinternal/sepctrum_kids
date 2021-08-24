import 'package:flutter/material.dart';

class MStyle {
  static Color appAccent = Colors.red;
  static Color appIconColor = Colors.cyan[900]!;
  static Color accent = Colors.blue[500]!;
  static Color white = Colors.white;
  static Color logo = Colors.blue[600]!;
  static Color logo2 = Colors.blue[300]!;
  static Color logo3 = Colors.blue[400]!;
  static Color logo4 = Colors.blue[500]!;
  static Color logo5 = Colors.blue[600]!;
  static Color logo6 = Colors.blue[700]!;
  static Color logo7 = Colors.blue[700]!;
  static Color logo8 = Colors.blue[800]!;
  static Color red = Colors.redAccent.shade400;
  static Color iconGrey = Colors.grey[600]!;

//  static Color iconGrey = Colors.grey[600];
  static Color iconBlack = Colors.black;

  // static LinearGradient materialSliverGradient(MaterialColor color) {
  //   return LinearGradient(
  //     begin: Alignment.topLeft,
  //     end: Alignment.bottomRight,
  //     colors: [...color[300] * 2, ...color[400] * 4, color[300]],
  //   );
  // }

  static LinearGradient mGradient1(MaterialColor color, {int? level}) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        ...color[100]! * 50,
        // ...color[50]! * 1,
        // ...color[200]! * 1,
        // ...color[100]! * 30,
      ],
    );
  }

  static RadialGradient mGradientRad(MaterialColor color) {
    return RadialGradient(
      // center: const Alignment(0.7, -0.6), // near the top right
      // radius: 0.2,
      // tileMode: TileMode.mirror,
      stops: [0.2,0.4, 1.0],
      colors: [
        ...color[200]! * 1,
        ...color[100]! * 1,
        // ...color[100]! * 1,
        ...color[50]! * 1,
        // ...color[200]! * 30,
        // ...color[100]! * 5,
      ],
    );
  }

  void paintSky(Canvas canvas, Rect rect) {
    var gradient = RadialGradient(
      center: const Alignment(0.7, -0.6), // near the top right
      radius: 0.2,
      colors: [
        const Color(0xFFFFFF00), // yellow sun
        const Color(0xFF0099FF), // blue sky
      ],
      stops: [0.4, 1.0],
    );
    // rect is the area we are painting over
    var paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);
  }

//   static LinearGradient colorGradientSample1({MaterialColor rawColor}) {
//     MaterialColor color = rawColor ?? Colors.blue;
//     return LinearGradient(colors: [
//       color[200],
//       ...color.getMultipleVariant(increment: 100, start: 200, end: 700)
//     ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
//   }
//
//   static LinearGradient mix2GradientSample({
//     MaterialColor start,
//     MaterialColor end,
//   }) {
//     MaterialColor color1 = start ?? Colors.blue;
//     MaterialColor color2 = end ?? Colors.black;
//     return LinearGradient(colors: [
//       ...color1.getMultipleVariant(
//           start: 800, end: 100, increment: 100, frequency: 4),
//       ...color2.getMultipleVariant(
//           start: 100, end: 400, increment: 100, frequency: 4),
//     ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
//   }
// }
}

extension ColorExt on Color {
  List<Color> operator *(int frequency) => [
        for (int i = 0; i < frequency; i++) this,
      ];
}

extension MColorExt on MaterialColor {
  List<Color> getMultipleVariant({
    int increment: 0,
    int start: 0,
    int end: 0,
    int frequency: 1,
  }) {
    var isForward = start < end;
    return [
      if (isForward)
        for (int i = start; i < end; i += increment) ...this[i]! * frequency,
      if (!isForward)
        for (int i = start; i > end; i -= increment) ...this[i]! * frequency,
    ];
  }
}
