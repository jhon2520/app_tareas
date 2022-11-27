import 'package:flutter/material.dart';
import 'dart:math';

class CustomAnimatedContainer extends StatefulWidget {

  final double orientarion;


  const CustomAnimatedContainer({Key? key, required this.orientarion}) : super(key: key);

  @override
  State<CustomAnimatedContainer> createState() => _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState extends State<CustomAnimatedContainer> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _translateAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _radiusAnimation; 

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
    _translateAnimation = Tween(begin: 0.0,end: 500.0).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _opacityAnimation = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _rotationAnimation = Tween(begin: 0.0,end: pi * 2).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _scaleAnimation = Tween(begin: 0.0,end: 1.5).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _radiusAnimation = Tween(begin: 0.0,end: 20.0).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat();
    return AnimatedBuilder(
      animation: _controller,
      child:  _Child(radius: _radiusAnimation.value,),
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.translate(
            offset: Offset(_translateAnimation.value,_translateAnimation.value * widget.orientarion),
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Transform.rotate(
                angle: _rotationAnimation.value,
                child: child),
            ),
          
          ),
        );
      },
    );

  }
}

class _Child extends StatelessWidget {

  final double radius;


  const _Child({
    Key? key,
    required this.radius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.all(Radius.circular(radius))
      ),
    );
  }
}