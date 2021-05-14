import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: GlassMorphism(),
    );
  }
}

// ignore: must_be_immutable
class GlassMorphism extends StatefulWidget {
  @override
  _GlassMorphismState createState() => _GlassMorphismState();
}

class _GlassMorphismState extends State<GlassMorphism> {
  var random;
  var opacity = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {
          opacity = 1.0;
        }));
    random = Random();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            new AnimatedOpacity(
              duration: Duration(seconds: 3),
              opacity: opacity,
              child: new Container(
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: new Image.asset(
                    'assets/images/1.jpg',
                    scale: 1.0,
                  ),
                ),
                transform: Matrix4.translationValues(
                    random
                            .nextInt(
                                (MediaQuery.of(context).size.width).toInt())
                            .toDouble() *
                        0.5,
                    random
                            .nextInt(
                                (MediaQuery.of(context).size.height).toInt())
                            .toDouble() *
                        0.5,
                    0.0),
              ),
            ),
            new AnimatedOpacity(
              duration: Duration(seconds: 3),
              opacity: opacity,
              child: new Container(
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: new Image.asset(
                    'assets/images/2.jpg',
                    scale: 1.0,
                  ),
                ),
                transform: Matrix4.translationValues(
                    random
                            .nextInt(
                                (MediaQuery.of(context).size.width).toInt())
                            .toDouble() *
                        0.4,
                    random
                            .nextInt(
                                (MediaQuery.of(context).size.height).toInt())
                            .toDouble() *
                        0.4,
                    0.0),
              ),
            ),
            new AnimatedOpacity(
              duration: Duration(seconds: 3),
              opacity: opacity,
              child: new Container(
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: new Image.asset(
                    'assets/images/3.jpg',
                    scale: 1.0,
                  ),
                ),
                transform: Matrix4.translationValues(
                    random
                            .nextInt(
                                (MediaQuery.of(context).size.width).toInt())
                            .toDouble() *
                        0.7,
                    random
                            .nextInt(
                                (MediaQuery.of(context).size.height).toInt())
                            .toDouble() *
                        0.8,
                    0.0),
              ),
            ),
            new AnimatedOpacity(
              duration: Duration(seconds: 3),
              opacity: opacity,
              child: new Container(
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: new Image.asset(
                    'assets/images/3.jpg',
                    scale: 1.0,
                  ),
                ),
                transform: Matrix4.translationValues(
                    random
                            .nextInt(
                                (MediaQuery.of(context).size.width).toInt())
                            .toDouble() *
                        0.2,
                    random
                            .nextInt(
                                (MediaQuery.of(context).size.height).toInt())
                            .toDouble() *
                        0.6,
                    0.0),
              ),
            ),
            new Center(
              child: new ClipRect(
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: new Container(
                    width: 300.0,
                    height: 300.0,
                    decoration:
                        new BoxDecoration(color: Colors.white.withOpacity(0.1)),
                    child: new Center(
                      child: new Text(
                        'Greek Art',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
