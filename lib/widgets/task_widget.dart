
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareitas/consts/app_const.dart';
import 'package:tareitas/models/task_model.dart';
import 'package:tareitas/state/task_bloc/task_bloc.dart';
import 'package:tareitas/utils/enums/custom_spacer_enum.dart';
import 'package:tareitas/utils/styles/color_utils.dart';
import 'package:tareitas/widgets/custom_spacer.dart';

class TaskWidget extends StatelessWidget {

  final TaskModel task;


  const TaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration:  BoxDecoration(
        boxShadow:const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0,3)
          )
        ],
        border: Border.all(color: AppConst.whiteColor),
        color: task.taskColor,
        borderRadius: const BorderRadius.all(Radius.circular(20))
    
      ),
      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      padding: const EdgeInsets.all(10),
      height: 10,
      child:  _CardTaskContainer(task:  task),
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

    final textStyle = AppConst.fontStyleBold.copyWith(color: AppConst.whiteColor);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(task.titulo!.toUpperCase(), style: textStyle.copyWith(fontWeight: FontWeight.bold,fontSize: 18)), 
        //Text(task.taskId!, style: textStyle), 
        Text(task.date!, style: textStyle),  
        Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          width: double.infinity,
          decoration:  BoxDecoration(
            color: Colors.black12.withOpacity(0.05),
                borderRadius: const BorderRadius.all(Radius.circular(20))

          ),
          height: 100,
          child: Text(task.descripcion!, style: textStyle,maxLines: 5,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)), 
        

      
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${AppConst.labelStateCard}: ${task.state}" ,style: textStyle,),
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
    );
  }
}