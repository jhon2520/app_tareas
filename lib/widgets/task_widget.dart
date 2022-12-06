
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareitas/consts/app_const.dart';
import 'package:tareitas/models/task_model.dart';
import 'package:tareitas/router/app_routes_strings.dart';
import 'package:tareitas/state/task_bloc/task_bloc.dart';
import 'package:tareitas/utils/enums/custom_spacer_enum.dart';
import 'package:tareitas/widgets/widget.dart';

class TaskWidgetController{

  TaskWidgetState? _state;
  

  Future deleteCartAnimation() async{
    return _state?.deleteCartAnimation();
  }
}

class TaskWidget extends StatefulWidget {


  final TaskModel task; 


  const TaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskWidget> createState() => TaskWidgetState();
}

class TaskWidgetState extends State<TaskWidget> with SingleTickerProviderStateMixin {

  final TaskWidgetController controller = TaskWidgetController();
  late AnimationController animationController;
  late Animation<double> _scaleAnimaciont;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _scaleAnimaciont = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOutBack));
    controller._state = this;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: _ChildContainer(task: widget.task, controller: controller),
      builder: (context, child) {
        return  Transform.scale(
        scale: 1-  _scaleAnimaciont.value,
        child: child
      );
      },
    );
  }

  Future deleteCartAnimation()async{

    await animationController.forward();
    if(animationController.status == AnimationStatus.completed){
      await   animationController.reverse();
    }
  }
}

class _ChildContainer extends StatelessWidget {

    final TaskModel task; 
    final TaskWidgetController controller;
  const _ChildContainer({Key? key, required this.task, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          clipBehavior: Clip.hardEdge,
          decoration:  const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 0.2,
                blurRadius: 0.2,
                offset: Offset(0,1)
              )
            ],
            color:Color.fromARGB(255, 230, 237, 240),
            borderRadius: BorderRadius.all(Radius.circular(20))
        
          ),
          margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          padding: const EdgeInsets.all(0),
          height: 10,
          child:  Stack(
            children:[ 
              _CustomBackgroundDecorationCard(task: task),
              _CardTaskContainer(task: task, controller: controller),
            ]
          ),
        );
  }
}

class _CustomBackgroundDecorationCard extends StatelessWidget {
  const _CustomBackgroundDecorationCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -40,
      top: -60,
      child: Transform.rotate(
        angle: 46,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: task.taskColor,
            borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
        ),
      ),
    );
  }
}

class _CardTaskContainer extends StatefulWidget {

  final TaskModel task;
  final TaskWidgetController controller;

  const _CardTaskContainer({
    Key? key,
    required this.task,
    required this.controller
  }) : super(key: key);

  @override
  State<_CardTaskContainer> createState() => _CardTaskContainerState();
}

class _CardTaskContainerState extends State<_CardTaskContainer> {
  @override
  Widget build(BuildContext context) {

    final taskBloc = BlocProvider.of<TaskBloc>(context);

    final textStyle = AppConst.fontStyleBold.copyWith(color: AppConst.backgrounColor);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.task.titulo!.toUpperCase(), style: textStyle.copyWith(fontWeight: FontWeight.bold,fontSize: 18)), 
          Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            width: double.infinity,
            decoration:  BoxDecoration(
              color: Colors.black12.withOpacity(0.05),
                  borderRadius: const BorderRadius.all(Radius.circular(20))

            ),
            height: 70,
            child: Text(widget.task.descripcion!, style: textStyle,maxLines: 4,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)), 
        //botones card
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${AppConst.labelLimitDate}: ${widget.task.date}" ,style: textStyle,),
              const Spacer(),
              CircleAvatar(
                backgroundColor: AppConst.editColor,
                child: IconButton(
                  onPressed: ()=> _editTask(taskBloc, widget.task), 
                  icon: const Icon(Icons.edit, color: AppConst.taksBackgroundColor,))),
              const CustomSpacer(size: CustomSpacerSizeEnum.m,isHorizontal: true,),
              CircleAvatar(
                backgroundColor: AppConst.deleteColor,
                child: IconButton(
                  onPressed: ()=>_deleteTask(taskBloc), 
                  icon: const Icon(Icons.delete, color: AppConst.taksBackgroundColor,))),
            ],
          ),
        ],
      ),
    );
  }

  void _deleteTask(TaskBloc taskBloc)async{
    await widget.controller.deleteCartAnimation();
    taskBloc.add(DeleteTaskEvent(widget.task.taskId!));
  }

  void _editTask(TaskBloc taskBloc, TaskModel? task)async{
    Navigator.pushNamed(context, AppRoutesString.createTaskPage, arguments: task);
  }
}