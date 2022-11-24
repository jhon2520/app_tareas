import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../consts/app_const.dart';
import '../state/task_bloc/task_bloc.dart';

class CustomColorPicker extends StatefulWidget {
  const CustomColorPicker({Key? key}) : super(key: key);

  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
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
        const Icon(Icons.arrow_back, color: AppConst.whiteColor,),
        Text(
          AppConst.labelSelectAColor,
          style: AppConst.fontStyle.copyWith(
              color: AppConst.whiteColor, fontSize: AppConst.fontSizeH3),
        ),
        const _ContainerColorIndicator()
      ],
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
}

class _ContainerColorIndicator extends StatelessWidget {
  const _ContainerColorIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TasksState>(
      builder: (context, state) {
        print(state.currentTaks?.taskColor);
        return Container(
          width: 25,
          height: 25,
          decoration:  BoxDecoration(
              color: state.currentTaks?.taskColor ?? AppConst.whiteColor,
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppConst.appRadius))),
        );
      },
    );
  }
}
