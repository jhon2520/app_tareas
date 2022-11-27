import 'package:flutter/material.dart';

import '../consts/app_const.dart';

class CustomSelectColorIndicator extends StatefulWidget {
  const CustomSelectColorIndicator({Key? key}) : super(key: key);

  @override
  State<CustomSelectColorIndicator> createState() => _CustomSelectColorIndicatorState();
}

class _CustomSelectColorIndicatorState extends State<CustomSelectColorIndicator> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;


  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 4000));
    _scaleAnimation = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _controller.forward();

    return AnimatedBuilder(
      animation: _controller,
      child: const _Child(),
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        ) ;
      },
    );
  }
}

class _Child extends StatelessWidget {
  const _Child({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.arrow_upward,
          color: AppConst.whiteColor,
          size: 12,
        ),
        Text(
          AppConst.labelSelectAColor,
          style: AppConst.fontStyle.copyWith(
              color: AppConst.whiteColor, fontSize: AppConst.fontSizeH5),
        ),
      ],
    );
  }
}
