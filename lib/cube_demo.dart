
import 'dart:math' as math;

import 'package:flutter/cupertino.dart' as v;
import 'package:flutter/material.dart';

class CubeDemo extends StatefulWidget {
  @override
  _CubeDemoState createState() => _CubeDemoState();
}

class _CubeDemoState extends State<CubeDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildFace(Color color, String label) {
    return Container(
      width: 150,
      height: 150,
      color: color.withOpacity(0.8),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(fontSize: 25, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            final angle = _controller.value * 2 * math.pi;

            return Transform(
              alignment: Alignment.center,
              transform: v.Matrix4.identity()
                ..setEntry(3, 2, 0.005) // perspective
                ..rotateX(angle)
                ..rotateY(angle * 0.7),
              child: Stack(
                children: [
                  // FRONT
                  Transform(
                    alignment: Alignment.center,
                    transform: v.Matrix4.translationValues(0, 0, 75),
                    child: buildFace(Colors.blue, "FRONT"),
                  ),

                  // BACK
                  Transform(
                    alignment: Alignment.center,
                    transform: v.Matrix4.translationValues(0, 0, -75)
                      ..rotateY(math.pi),
                    child: buildFace(Colors.red, "BACK"),
                  ),

                  // LEFT
                  Transform(
                    alignment: Alignment.center,
                    transform: v.Matrix4.translationValues(-75, 0, 0)
                      ..rotateY(-math.pi / 2),
                    child: buildFace(Colors.green, "LEFT"),
                  ),

                  // RIGHT
                  Transform(
                    alignment: Alignment.center,
                    transform: v.Matrix4.translationValues(75, 0, 0)
                      ..rotateY(math.pi / 2),
                    child: buildFace(Colors.orange, "RIGHT"),
                  ),

                  // TOP
                  Transform(
                    alignment: Alignment.center,
                    transform: v.Matrix4.translationValues(0, -75, 0)
                      ..rotateX(-math.pi / 2),
                    child: buildFace(Colors.purple, "TOP"),
                  ),

                  // BOTTOM
                  Transform(
                    alignment: Alignment.center,
                    transform: v.Matrix4.translationValues(0, 75, 0)
                      ..rotateX(math.pi / 2),
                    child: buildFace(Colors.yellow, "BOTTOM"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}