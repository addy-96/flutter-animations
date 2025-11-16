import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as v;
import 'package:flutter/material.dart';
import 'package:flutter_animations/rotating_box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RotaingBox());
  }
}

