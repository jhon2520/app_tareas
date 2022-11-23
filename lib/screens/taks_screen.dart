import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tareitas/consts/app_const.dart';
import 'package:tareitas/screens/new_task_screen.dart';
import '../widgets/task_list.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: AppConst.backgrounColor,
      body: Stack(children:[ 
        const Positioned(
          top: -300,
          left: 0,
          child:_BackgroundDecorator()
        ),
        const Positioned(
          bottom: -300,
          left: 0,
          child: _BackgroundDecorator(),
        ),
        TasksList(size: size)
        ]
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppConst.floatingActionButton,
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewTaskScreen()))
          },
          child: const Icon(Icons.add)),
    );
  }


}

class _BackgroundDecorator extends StatelessWidget {
  const _BackgroundDecorator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 35,
      child: Container(
        decoration: const BoxDecoration(
          color: AppConst.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(40))
        ),
        width: 400,
        height: 400,
      ),
    );
  }
}
