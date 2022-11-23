import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareitas/consts/app_const.dart';
import 'package:tareitas/state/task_bloc/task_bloc.dart';

class CustomFormDropDown extends StatefulWidget {
  String dropDownValue;
  final List<String> items;

  CustomFormDropDown(
      {Key? key, required this.dropDownValue, required this.items})
      : super(key: key);

  @override
  State<CustomFormDropDown> createState() => _CustomFormDropDownState();
}

class _CustomFormDropDownState extends State<CustomFormDropDown> {
  @override
  Widget build(BuildContext context) {

    final taskBloc = BlocProvider.of<TaskBloc>(context);

    return DropdownButtonFormField<String>(
        
        decoration: InputDecoration(
          focusedBorder: AppConst.formFieldBorder,
          enabledBorder: AppConst.formFieldBorder.copyWith(
            borderSide: BorderSide(
              color: AppConst.whiteColor.withOpacity(0.5),
            ),
          ),
        ),
        dropdownColor: AppConst.taksFormBackground.withGreen(125).withBlue(120),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        isExpanded: true,
        icon: const Icon(
          Icons.arrow_drop_down_rounded,
          color: AppConst.whiteColor,
        ),
        value: widget.dropDownValue,
        items: widget.items.map((String states) {
          return DropdownMenuItem(
              value: states,
              child: Text(
                states,
                style: AppConst.fontStyle.copyWith(color: AppConst.whiteColor),
              ));
        }).toList(),
        onChanged: (value) {
          
          final currentTask = taskBloc.state.currentTaks!.copyWith(
            state: value
          );
          taskBloc.add(SetCurrentTaskEvent(currentTask));

        });
  }
}
