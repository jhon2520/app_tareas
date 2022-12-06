import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:tareitas/widgets/show_snackbar.dart';
import 'package:tareitas/widgets/widget.dart';
import '../consts/app_const.dart';
import '../consts/snackbar_const.dart';
import '../state/task_bloc/task_bloc.dart';
import '../utils/enums/tipo_snackbar_enum.dart';



class CustomColorPickerController{

  _CustomColorPickerState? _state;
  
  Color? color;

  void setValue(Color value) {
    color = value;
  }

  // void prueba(Color color){
  //   return _state?.pruba(color);
  // }

}

class CustomColorPicker extends StatefulWidget {

  final CustomColorPickerController controller;
  final Color? taskEditColor;
  const CustomColorPicker({Key? key, this.taskEditColor, required this.controller}) : super(key: key);

  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {


  @override
  void initState() {
    super.initState();
    widget.controller._state = this;
  }


  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);
    return SizedBox(
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: _ContainerColorIndicator(taskEditColor : widget.taskEditColor,controller: widget.controller,)),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showColorPicker(context, taskBloc, widget.controller),
            icon: const CircleAvatar(
              backgroundColor: AppConst.floatingActionButton,
              minRadius: 55,
              child: Icon(
                Icons.color_lens,
                color: AppConst.whiteColor,
                size: 45,
              ),
            ),
          ),
          const CustomSelectColorIndicator(),
        ],
      ),
    );
    
  }
    // void pruba(Color color){
    //   print("usando el controller $color");
    // }

  void _showColorPicker(BuildContext context, TaskBloc taskBloc,CustomColorPickerController controller ) {
    Color mycolor = Colors.lightBlue;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(color: AppConst.whiteColor)),
          backgroundColor: AppConst.backgrounColor,
          content: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              ColorPicker(
                labelTypes: const [],
                paletteType: PaletteType.hueWheel,
                pickerColor: mycolor,
                onColorChanged: (value) {
                  final currentTask =
                      taskBloc.state.currentTaks!.copyWith(taskColor: value);
                  taskBloc.add(SetCurrentTaskEvent(currentTask));
                  controller.setValue(value);
                },
              ),
            ],
          ),
          actions: <Widget>[
            PrimaryButton(label: AppConst.labelButtonDone,onPressed: ()=> _selectColorAndPop(context)),
          ],
        );
      },
    );
  }
  void _selectColorAndPop(BuildContext context){
    ShowSnackBar.showSnackBar(context, TipoSnakBarEnum.info, SnackbarConst.colorSelectedMessage);
    Navigator.of(context).pop();
  }
}

class _ContainerColorIndicator extends StatelessWidget {

  final Color? taskEditColor;
  final CustomColorPickerController controller;

  const _ContainerColorIndicator({
    Key? key,
    required this.controller,
    this.taskEditColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TasksState>(
      builder: (context, state) {
        return Container(
          width: 12,
          height: 12,
          decoration:  BoxDecoration(
              border: Border.all(color: AppConst.whiteColor),
              color:  controller.color ?? taskEditColor,
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppConst.appRadius))),
        );
      },
    );
  }
}
