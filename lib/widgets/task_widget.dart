
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareitas/consts/app_const.dart';
import 'package:tareitas/models/task_model.dart';
import 'package:tareitas/state/task_bloc/task_bloc.dart';
import 'package:tareitas/utils/enums/custom_spacer_enum.dart';
import 'package:tareitas/widgets/custom_spacer.dart';

class TaskWidget extends StatelessWidget {

  final TaskModel task;


  const TaskWidget({Key? key, required this.task}) : super(key: key);

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
          _CardTaskContainer(task:  task),
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

class _CardTaskContainer extends StatelessWidget {

  final TaskModel task;

  const _CardTaskContainer({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final taskBloc = BlocProvider.of<TaskBloc>(context);

    final textStyle = AppConst.fontStyleBold.copyWith(color: AppConst.backgrounColor);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(task.titulo!.toUpperCase(), style: textStyle.copyWith(fontWeight: FontWeight.bold,fontSize: 18)), 
          Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            width: double.infinity,
            decoration:  BoxDecoration(
              color: Colors.black12.withOpacity(0.05),
                  borderRadius: const BorderRadius.all(Radius.circular(20))

            ),
            height: 70,
            child: Text(task.descripcion!, style: textStyle,maxLines: 4,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)), 
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${AppConst.labelLimitDate}: ${task.date}" ,style: textStyle,),
              //Text(task.date!, style: textStyle),  
              const Spacer(),
              CircleAvatar(
                backgroundColor: AppConst.editColor,
                child: IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.edit, color: AppConst.taksBackgroundColor,))),
              const CustomSpacer(size: CustomSpacerSizeEnum.m,isHorizontal: true,),
              CircleAvatar(
                backgroundColor: AppConst.deleteColor,
                child: IconButton(
                  onPressed: (){
                    taskBloc.add(DeleteTaskEvent(task.taskId!));
                  }, 
                  icon: const Icon(Icons.delete, color: AppConst.taksBackgroundColor,))),
            ],
          ),
        ],
      ),
    );
  }
}