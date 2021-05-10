import 'package:flutter/material.dart';
import 'randomPlaceImage.dart';
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
  List<Widget> widgets = <Widget>[];

  List<Widget> imagesArray(var random) {
    List<Widget> widgets = <Widget>[];
    for (int loop = 1; loop <= 21; loop++) {
      widgets.add(
        AnimatedImage(
          imageName: 'images/' + loop.toString() + '.jpg',
          random: random,
          passedContext: context,
        ),
      );
    }
    return widgets;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {
          var random = Random();
          widgets = imagesArray(random);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            new Stack(
              children: widgets,
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
