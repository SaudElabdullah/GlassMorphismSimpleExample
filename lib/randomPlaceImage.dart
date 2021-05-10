import 'package:flutter/material.dart';

class AnimatedImage extends StatefulWidget {
  const AnimatedImage(
      {Key? key, this.random, this.imageName, this.passedContext})
      : super(key: key);
  final random;
  final imageName;
  final passedContext;

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: AspectRatio(
        aspectRatio: 1 / 2,
        child: new Image.asset(
          widget.imageName,
          scale: 1.0,
        ),
      ),
      transform: Matrix4.translationValues(
          widget.random
              .nextInt((MediaQuery.of(widget.passedContext).size.width).toInt())
              .toDouble(),
          widget.random
              .nextInt(
                  (MediaQuery.of(widget.passedContext).size.height).toInt())
              .toDouble(),
          0.0),
    );
  }
}
