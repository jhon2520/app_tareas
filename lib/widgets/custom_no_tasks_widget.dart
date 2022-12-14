import 'package:flutter/material.dart';
import 'package:tareitas/consts/app_const.dart';


class CustomNoTaskWidget extends StatefulWidget {
  const CustomNoTaskWidget({Key? key}) : super(key: key);

  @override
  State<CustomNoTaskWidget> createState() => _CustomNoTaskWidgetState();
}

class _CustomNoTaskWidgetState extends State<CustomNoTaskWidget>  with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation _animtationRotate;
  late Animation _animationTraslate;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 3000));
    _animtationRotate = Tween(begin: 0.0,end: 2.0).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    _animationTraslate = Tween(begin: 0.0,end: 100.0).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
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
        return Transform.translate(
          offset: Offset(0,_animationTraslate.value),
          child: Transform.scale(
            scale: _animtationRotate.value,
            child: child,
          ),
        );
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
        Text(AppConst.labelNoTasks, style: AppConst.fontStyle.copyWith(color: AppConst.whiteColor,fontWeight: FontWeight.bold)),
        Text(AppConst.labelCreateTasks, style: AppConst.fontStyle.copyWith(color: AppConst.whiteColor,)),
        const Icon(Icons.arrow_downward_sharp, color: AppConst.whiteColor,size: 50,)
      ],
    );
  }
}