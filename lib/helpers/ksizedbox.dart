import 'package:flutter/material.dart';

class Ksize {
  static const ksize20 = SizedBox(height: 20);
  static const ksize10 = SizedBox(height: 10);
  static const ksize5 = SizedBox(height: 5);
  static const kWsize10 = SizedBox(width: 10);
  static const kWsize20 = SizedBox(width: 20);
  static const ksize30 = SizedBox(height: 30);
  static const ksize40 = SizedBox(height: 40);
  static const ksize50 = SizedBox(height: 50);
  static const ksize60 = SizedBox(height: 60);
  static const ksize70 = SizedBox(height: 70);
  static const ksize80 = SizedBox(height: 80);
}

class TextWithFamily extends StatelessWidget {
  const TextWithFamily({
    Key? key,
    required this.title,
    required this.ls,
    required this.colors,
    required this.fontwght,
    required this.fontsz,
    required this.textalign,
    required this.maxline,
    required this.ws,
  }) : super(key: key);
  final String title;
  final double ls;
  final Color colors;
  final FontWeight fontwght;
  final double fontsz;
  final TextAlign textalign;
  final int maxline;
  final double ws;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          letterSpacing: ls,
          fontFamily: Theme.of(context).textTheme.subtitle1?.fontFamily,
          color: colors,
          fontSize: fontsz,
          fontWeight: fontwght,
          wordSpacing: ws),
      textAlign: textalign,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({
    Key? key,
    required this.title,
    required this.ls,
    required this.colors,
    required this.fontwght,
    required this.fontsz,
    required this.textalign,
    required this.maxline,
  }) : super(key: key);
  final String title;
  final double ls;
  final Color colors;
  final FontWeight fontwght;
  final double fontsz;
  final TextAlign textalign;
  final int maxline;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        letterSpacing: ls,
        fontFamily: Theme.of(context).textTheme.headline1?.fontFamily,
        color: colors,
        fontSize: fontsz,
        fontWeight: fontwght,
      ),
      textAlign: textalign,
      maxLines: maxline,
    );
  }
}

class Titlete extends StatelessWidget {
  const Titlete({
    Key? key,
    required this.title,
    required this.ls,
    required this.colors,
    required this.fontwght,
    required this.fontsz,
    required this.textalign,
    required this.maxline,
  }) : super(key: key);
  final String title;
  final double ls;
  final Color colors;
  final FontWeight fontwght;
  final double fontsz;
  final TextAlign textalign;
  final int maxline;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        letterSpacing: ls,
        fontFamily: Theme.of(context).textTheme.headline1?.fontFamily,
        color: colors,
        fontSize: fontsz,
        fontWeight: fontwght,
        decoration: TextDecoration.lineThrough,
      ),
      textAlign: textalign,
      maxLines: maxline,
    );
  }
}
