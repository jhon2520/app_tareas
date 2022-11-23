import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:tareitas/consts/app_const.dart';
import 'package:tareitas/models/task_model.dart';
import 'package:tareitas/state/task_bloc/task_bloc.dart';
import 'package:tareitas/utils/utils.dart';
import 'package:tareitas/widgets/primary_button.dart';
import 'package:tareitas/widgets/secondary_button.dart';
import 'package:tareitas/widgets/widget.dart' show CustomFormDatePicker, CustomFormDropDown, CustomFormField, CustomSpacer;
import '../utils/enums/enum.dart' show CustomSpacerSizeEnum, TaskState;



class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  final List<String> states = [
    TaskState.inProgress.labelText,
    TaskState.done.labelText,
    TaskState.undefined.labelText
  ];

  final String dropDownValue = TaskState.undefined.labelText;

    final fontsyle = AppConst.fontStyle.copyWith(color: AppConst.whiteColor, fontSize: 12);
  
    late TextEditingController _controllerTitle;
    late TextEditingController _controllerDescription;

    @override
  void initState() {
    _controllerTitle = TextEditingController();
    _controllerDescription = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final taskBloc = BlocProvider.of<TaskBloc>(context);


    return Scaffold(
      backgroundColor: AppConst.backgrounColor.withOpacity(0.8),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConst.backgrounColor,
        title: const Text(AppConst.labelCreateTaks),
      ),
      body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          physics: const BouncingScrollPhysics(),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomFormField(
                  labelField: AppConst.labelTitle,
                  controller:_controllerTitle ,
                  onPressedIcon: () {},
                ),
                const CustomSpacer(size: CustomSpacerSizeEnum.xl,),
                CustomFormField(
                  labelField: AppConst.labelDescription,
                  isMultiline: true,
                  controller: _controllerDescription,
                  onPressedIcon: () {},
                ),
                const CustomSpacer(size: CustomSpacerSizeEnum.xl,),
                CustomFormDropDown(dropDownValue: dropDownValue, items: states),
                const CustomSpacer(size: CustomSpacerSizeEnum.xl,),
                const CustomFormDatePicker(),
                const CustomSpacer(size: CustomSpacerSizeEnum.xxl,),
                IconButton(onPressed: ()=>_showColorPicker(context,taskBloc), 
                  icon: Icon(Icons.color_lens,color: AppConst.whiteColor,size: 45,)),
              
                const CustomSpacer(size: CustomSpacerSizeEnum.xxl,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SecondaryButton(label: AppConst.labelCancel, onPressed: (){},),
                    const CustomSpacer(size: CustomSpacerSizeEnum.x, isHorizontal: true,),
                    PrimaryButton(label: AppConst.labelAdd,onPressed: (){

                      _createNewTask(taskBloc);
                    }),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
        ),
    );
  }

  void _showColorPicker(BuildContext context,TaskBloc taskBloc ) {
    Color mycolor = Colors.lightBlue;
    showDialog(

      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(
              color: AppConst.whiteColor
            )
          ),
          backgroundColor: AppConst.backgrounColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ColorPicker(
                pickerColor: mycolor,
                onColorChanged: (value) {
                  print(value);
                   final currentTask = taskBloc.state.currentTaks!.copyWith(
                    taskColor: value);
                    taskBloc.add(SetCurrentTaskEvent(currentTask));

                },
              ),
            ],
          ),
              actions: <Widget>[
              ElevatedButton(
                child: const Text('DONE'),
                onPressed: () {
                  Navigator.of(context).pop(); //dismiss the color picker
                },
              ),
            ],
        );
      },
    );
  }

  void _createNewTask(TaskBloc taskBloc) {
      
    final currentTask = taskBloc.state.currentTaks!.copyWith(
      taskId: TimeUtils.idGenerator(),
      titulo: _controllerTitle.text,
      descripcion: _controllerDescription.text
    );
    taskBloc.add(SetCurrentTaskEvent(currentTask));
    taskBloc.add(ActivateTaskEvent(currentTask));
     

  }
}