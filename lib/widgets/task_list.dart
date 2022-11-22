import 'package:flutter/material.dart';
import 'package:tareitas/widgets/task_widget.dart';


class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: size.height ,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const TaskWidget();
          },
        ),
      ),
    );
  }
}