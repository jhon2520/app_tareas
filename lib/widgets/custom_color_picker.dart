import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:tareitas/widgets/show_snackbar.dart';
import 'package:tareitas/widgets/widget.dart';

import '../consts/app_const.dart';
import '../consts/snackbar_const.dart';
import '../state/task_bloc/task_bloc.dart';
import '../utils/enums/tipo_snackbar_enum.dart';

class CustomColorPicker extends StatefulWidget {
  const CustomColorPicker({Key? key}) : super(key: key);

  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);
    return SizedBox(
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: _ContainerColorIndicator()),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showColorPicker(context, taskBloc),
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

  void _showColorPicker(BuildContext context, TaskBloc taskBloc) {
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
                labelTypes: [],
                paletteType: PaletteType.hueWheel,
                pickerColor: mycolor,
                onColorChanged: (value) {
                  final currentTask =
                      taskBloc.state.currentTaks!.copyWith(taskColor: value);
                  taskBloc.add(SetCurrentTaskEvent(currentTask));
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
    //TODO : cambiar color de los tipoSnackBarEnum
    ShowSnackBar.showSnackBar(context, TipoSnakBarEnum.info, SnackbarConst.colorSelectedMessage);
    Navigator.of(context).pop();
  }
}

class _ContainerColorIndicator extends StatelessWidget {
  const _ContainerColorIndicator({
    Key? key,
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
              color: state.currentTaks?.taskColor ?? AppConst.whiteColor,
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppConst.appRadius))),
        );
      },
    );
  }
}
