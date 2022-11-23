import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/task_bloc/task_bloc.dart';
import 'widget.dart' show CustomNoTaskWidget, TaskWidget;

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
        height: size.height,
        child: BlocBuilder<TaskBloc, TasksState>(
          builder: (context, state) {

            if(state.existTask == false || state.taks == null || state.taks!.isEmpty){
              return const Center(child: CustomNoTaskWidget());
            }

            final task = state.taks;
        

            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: size.width / (size.height / 3)),
              itemCount: task!.length,
              itemBuilder: (BuildContext context, int index) {

                final task = state.taks![index];
                return  TaskWidget(task: task);

                
              },
            );
          },
        ),
      ),
    );
  }
}
