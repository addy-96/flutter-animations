import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as v;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double rotateY = 0.1;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _animation = Tween(begin: 0.0, end: 2.0).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(1, 3, 0.001)
            ..rotateY(rotateY),
          child: GestureDetector(
            onTap: () {
              setState(() {
                rotateY += 0.1;
              });
            },
            child: Container(width: 150, height: 150, color: Colors.green),
          ),
        ),
      ),
    );
  }
}
