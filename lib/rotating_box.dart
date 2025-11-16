import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RotaingBox extends StatefulWidget {
  const RotaingBox({super.key});

  @override
  State<RotaingBox> createState() => _RotatingBoxState();
}

class _RotatingBoxState extends State<RotaingBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double rotateY = 0.1;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 2.0).animate(_controller);
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateY(_animation.value),
            child: Container(width: 150, height: 150, color: Colors.green),
          ),
        ),
      ),
    );
  }
}
