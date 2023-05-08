import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final int? maxLines;
  double size;
  double height;

  SmallText(
      {Key? key,
      this.color = const Color(0xFF9E9E9E),
      required this.text,
      this.size = 12,
      this.height = 1.2,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        style: TextStyle(
            color: color,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
            fontSize: size,
            height: height));
  }
}
