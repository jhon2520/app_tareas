import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tareitas/consts/app_const.dart';
import 'package:tareitas/consts/snackbar_const.dart';
import 'package:tareitas/models/task_model.dart';
import 'package:tareitas/router/app_routes_strings.dart';
import 'package:tareitas/state/task_bloc/task_bloc.dart';
import 'package:tareitas/utils/enums/tipo_snackbar_enum.dart';
import 'package:tareitas/utils/utils.dart';
import 'package:tareitas/widgets/widget.dart' show CustomColorPicker, CustomColorPickerController, CustomFormDatePicker, CustomFormField, CustomSpacer, PrimaryButton, SecondaryButton;
import '../utils/enums/enum.dart' show CustomSpacerSizeEnum, TaskState;
import '../widgets/show_snackbar.dart';



class NewTaskScreen extends StatefulWidget {

  final TaskModel? task;

  const NewTaskScreen({Key? key, this.task}) : super(key: key);

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
    late TextEditingController _controllerDate;
    late CustomColorPickerController _controllerColorPicker;

    @override
  void initState() {
    _controllerTitle = TextEditingController();
    _controllerDescription = TextEditingController();
    _controllerDate = TextEditingController();
    _controllerColorPicker = CustomColorPickerController();
    super.initState();
    _setearValoresEditados();
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
        title: Text( widget.task == null ? AppConst.labelCreateTaks : AppConst.labelEditTask),
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
                    CustomFormDatePicker(
                      controller: _controllerDate,
                    ),
                    const CustomSpacer(size: CustomSpacerSizeEnum.xxl,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomColorPicker(taskEditColor: widget.task?.taskColor,controller: _controllerColorPicker),
                        SecondaryButton(
                          label: AppConst.labelCancel, 
                          onPressed: ()=> cancelTask(context),), 
                        const CustomSpacer(size: CustomSpacerSizeEnum.x, isHorizontal: true,),
                        PrimaryButton(
                          label: widget.task == null ? AppConst.labelAdd : AppConst.labelEdit,
                          onPressed: ()=>_createNewTask(taskBloc, context)
                        ),
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

  void cancelTask(BuildContext context){
    Navigator.pushNamed(context, AppRoutesString.homePage); 
  }

  void _setearValoresEditados(){

    if(widget.task !=null){
      _controllerTitle.text = widget.task!.titulo!;
      _controllerDescription.text = widget.task!.descripcion!;
      _controllerDate.text = widget.task!.date!;
    }
  }

  void _clearValues(){
      _controllerTitle.clear();
      _controllerDescription.clear();
      _controllerDate.clear();
  }

  void _createNewTask(TaskBloc taskBloc, BuildContext context) {

    if(validarExistenCamposFaltantes()){
      ShowSnackBar.showSnackBar(context, TipoSnakBarEnum.error,AppConst.labelCamposFaltantes);
      return;
    }

    try {
      if (widget.task != null) {
        _editTask(taskBloc, context);
      }
      if (widget.task == null) {
        _createTask(taskBloc, context);
      }

      _clearValues();
      Navigator.pushNamed(context, AppRoutesString.homePage); 
    } catch (e) {
      ShowSnackBar.showSnackBar(context, TipoSnakBarEnum.error, e.toString());
    }
  }

  bool validarExistenCamposFaltantes(){
if(_controllerTitle.text.isEmpty || _controllerDescription.text.isEmpty || _controllerDate.text.isEmpty){
      return true;
    }
    return false;
  }

  void _createTask(TaskBloc taskBloc, BuildContext context) {

    final currentTask = taskBloc.state.currentTaks!.copyWith(
        taskColor: _controllerColorPicker.color,
        taskId: TimeUtils.idGenerator(),
        titulo: _controllerTitle.text,
        descripcion: _controllerDescription.text,
        date: _controllerDate.text);
    taskBloc.add(SetCurrentTaskEvent(currentTask));
    taskBloc.add(ActivateTaskEvent(currentTask));
    ShowSnackBar.showSnackBar(
        context, TipoSnakBarEnum.success, SnackbarConst.taskCreatedMessage);
  }

  void _editTask(TaskBloc taskBloc, BuildContext context) {
    final TaskModel taskToEdit = widget.task!.copyWith(
        taskColor: _controllerColorPicker.color,
        titulo: _controllerTitle.text,
        descripcion: _controllerDescription.text,
        date: _controllerDate.text);
    taskBloc.add(EditTaskEvent(taskToEdit));
    ShowSnackBar.showSnackBar(
        context, TipoSnakBarEnum.success, SnackbarConst.taskEditedMessage);
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