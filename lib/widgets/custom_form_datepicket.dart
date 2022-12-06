import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareitas/consts/app_const.dart';
import 'package:tareitas/models/task_model.dart';
import 'package:tareitas/state/task_bloc/task_bloc.dart';

class CustomFormDatePicker extends StatefulWidget {

  final TextEditingController controller;

  const CustomFormDatePicker({Key? key, required this.controller}) : super(key: key);

  @override
  State<CustomFormDatePicker> createState() => _CustomFormDatePickerState();
}

class _CustomFormDatePickerState extends State<CustomFormDatePicker> {

  //late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    //_controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    final fontsyle = AppConst.fontStyle.copyWith(color: AppConst.whiteColor, fontSize: 12);
    final taskBloc = BlocProvider.of<TaskBloc>(context);


        return SizedBox(
          height: 50,
          child: TextFormField(
            
            enableInteractiveSelection: false,
            // initialValue: date,
            onChanged: (value) {},
            controller: widget.controller,
            onTap: () => _onTap(taskBloc: taskBloc),
            style: fontsyle,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.calendar_month,
                  color: AppConst.whiteColor, size: 14),
              suffixIconColor: AppConst.whiteColor,
              label: Text(AppConst.labelDate,
                  style: AppConst.fontStyle.copyWith(color: AppConst.whiteColor)),
              focusedBorder: AppConst.formFieldBorder,
              enabledBorder: AppConst.formFieldBorder.copyWith(
                borderSide: BorderSide(
                  color: AppConst.whiteColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        );
      }

  Future<void> _onTap({TaskBloc? taskBloc}) async {
    FocusScope.of(context).requestFocus(FocusNode());
    DateTime date = DateTime(2022, 12, 31);

    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (newDate == null) {
      return;
    }

    final currentTask = taskBloc!.state.currentTaks?.copyWith(
      date: newDate.toString().substring(0,10)
    );

    TaskModel newTask = TaskModel();

    taskBloc.add(SetCurrentTaskEvent(currentTask ?? newTask));
    widget.controller.text = newDate.toString().substring(0,10);
  }
}
