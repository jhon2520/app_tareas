import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tareitas/consts/app_const.dart';
import 'package:tareitas/consts/snackbar_const.dart';
import 'package:tareitas/state/task_bloc/task_bloc.dart';
import 'package:tareitas/utils/enums/tipo_snackbar_enum.dart';
import 'package:tareitas/utils/utils.dart';
import 'package:tareitas/widgets/primary_button.dart';
import 'package:tareitas/widgets/secondary_button.dart';
import 'package:tareitas/widgets/show_snackbar.dart';
import 'package:tareitas/widgets/widget.dart' show CustomColorPicker, CustomFormDatePicker, CustomFormField, CustomSpacer;
import '../utils/enums/enum.dart' show CustomSpacerSizeEnum, TaskState;



class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  final List<String> states = [
    TaskState.inProgress.normalTextText,
    TaskState.done.normalTextText,
    TaskState.undefined.normalTextText
  ];

  final String dropDownValue = TaskState.undefined.normalTextText;

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
    final GlobalKey<ScaffoldState> scafoldKey = GlobalKey<ScaffoldState>();


    return Scaffold(
      key: scafoldKey,
      backgroundColor: AppConst.backgrounColor.withOpacity(0.8),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConst.backgrounColor,
        title: const Text(AppConst.labelCreateTaks),
      ),
      body: Stack(
        children:[ 
          const Positioned(
            right: -30,
            top: -120,
            child: _CustomDecoratorBackground(),
          ),
          const Positioned(
            left: -30,
            bottom: -120,
            child: _CustomDecoratorBackground(angle: 20,),
          ),
          const Positioned(
            right: 0,
            bottom: -10,
            child: _CustomDecoratorBackground(angle: 10,size: 45,),
          ),
          const Positioned(
            right: 90,
            bottom: 90,
            child: _CustomDecoratorBackground(angle: 15,size: 30,),
          ),
          Padding(
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
                    const CustomSpacer(size: CustomSpacerSizeEnum.l,),
                    CustomFormField(
                      labelField: AppConst.labelDescription,
                      isMultiline: true,
                      controller: _controllerDescription,
                      onPressedIcon: () {},
                    ),
                    const CustomSpacer(size: CustomSpacerSizeEnum.l,),
                    const CustomFormDatePicker(),
                    const CustomSpacer(size: CustomSpacerSizeEnum.l,),
                    const CustomSpacer(size: CustomSpacerSizeEnum.xxl,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomColorPicker(),
                        SecondaryButton(label: AppConst.labelCancel, onPressed: (){
            
                        },),
                        const CustomSpacer(size: CustomSpacerSizeEnum.x, isHorizontal: true,),
                        PrimaryButton(label: AppConst.labelAdd,onPressed: (){
      
                          _createNewTask(taskBloc, context);
                        }),
                      ],
                    )
      
                  ],
                ),
              ),
            ),
        ),
          ),
      ]
      ),
    );
  }


  

  void _createNewTask(TaskBloc taskBloc, BuildContext context) {
    try {
      final currentTask = taskBloc.state.currentTaks!.copyWith(
          taskId: TimeUtils.idGenerator(),
          titulo: _controllerTitle.text,
          descripcion: _controllerDescription.text);
      taskBloc.add(SetCurrentTaskEvent(currentTask));
      taskBloc.add(ActivateTaskEvent(currentTask));

      ShowSnackBar.showSnackBar(context, TipoSnakBarEnum.success, SnackbarConst.taskCreatedMessage);
    } catch (e) {
      ShowSnackBar.showSnackBar(context, TipoSnakBarEnum.error, e.toString());
    }
  }
}

class _CustomDecoratorBackground extends StatelessWidget {

  final double? angle;
  final double? size;

  const _CustomDecoratorBackground({
    Key? key,
    this.angle,
    this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle ?? 34,
      child: Container(
        width: size ?? 250,
        height: size ?? 180,
        decoration: const BoxDecoration(
          //border: Border.all(color: Colors.white),
          color: AppConst.backgrounColor,
          
        ),
      ),
    );
  }
}