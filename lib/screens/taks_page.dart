import 'package:flutter/material.dart';
import 'package:tareitas/consts/app_const.dart';
import '../utils/task_state_enum.dart';
import '../widgets/task_list.dart';

class TaskPage extends StatelessWidget {
  TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: AppConst.backgrounColor,
      body: TasksList(size: size),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppConst.floatingActionButton,
          onPressed: () => showModalTask(context),
          child: const Icon(Icons.add)),
    );
  }

  void showModalTask(BuildContext context) {
    final fontsyle =
        AppConst.fontStyle.copyWith(color: AppConst.whiteColor, fontSize: 12);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          content: Container(
            decoration: BoxDecoration(
                color: AppConst.taksFormBackground,
                border: Border.all(
                    color: AppConst.taksBackgroundColor,
                    width: 0.5,
                    strokeAlign: StrokeAlign.center),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            padding: const EdgeInsets.all(20),
            width: 300,
            height: 350,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    style: fontsyle,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.close,
                          color: AppConst.whiteColor, size: 14),
                      suffixIconColor: AppConst.whiteColor,
                      label: Text(AppConst.labelTitle,
                          style: AppConst.fontStyle
                              .copyWith(color: AppConst.whiteColor)),
                      focusedBorder: AppConst.formFieldBorder,
                      enabledBorder: AppConst.formFieldBorder.copyWith(
                        borderSide: BorderSide(
                          color: AppConst.whiteColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: fontsyle,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.close,
                          color: AppConst.whiteColor, size: 14),
                      suffixIconColor: AppConst.whiteColor,
                      label: Text(AppConst.labelDescription,
                          style: AppConst.fontStyle
                              .copyWith(color: AppConst.whiteColor)),
                      focusedBorder: AppConst.formFieldBorder,
                      enabledBorder: AppConst.formFieldBorder.copyWith(
                        borderSide: BorderSide(
                          color: AppConst.whiteColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                        focusedBorder: AppConst.formFieldBorder,
                        enabledBorder: AppConst.formFieldBorder.copyWith(
                          borderSide: BorderSide(
                            color: AppConst.whiteColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                      dropdownColor: AppConst.taksFormBackground
                          .withGreen(125)
                          .withBlue(120),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down_rounded, color: AppConst.whiteColor,),
                      value: dropDownValue,
                      items: states.map((String states) {
                        return DropdownMenuItem(
                            value: states,
                            child: Text(
                              states,
                              style: AppConst.fontStyle
                                  .copyWith(color: AppConst.whiteColor),
                            ));
                      }).toList(),
                      onChanged: (value) {}),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextButton(

                              style: TextButton.styleFrom(
                                backgroundColor: AppConst.taksFormBackground,
                                shape: const StadiumBorder(),
                                side:BorderSide(
                                  color: AppConst.whiteColor.withOpacity(0.6)
                                )
                              ),  
                              onPressed: (){}, 
                              child: Text(
                                AppConst.labelCancel, 
                                style: AppConst.fontStyle.copyWith(color: AppConst.whiteColor,),),),
                          ), 
                          SizedBox(width: 10,),
                          SizedBox(
                            width: 100,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: AppConst.whiteColor,
                                shape: const StadiumBorder(),
                                
                              ),  
                              onPressed: (){}, 
                              child: Text(
                                AppConst.labelAdd, 
                                style: AppConst.fontStyle.copyWith(color: AppConst.taksFormBackground,),),),
                          ),
                        ],
                      )

                ],
              ),
            ),
          ),
        );
      },
    );
  }

  final List<String> states = [
    TaskState.inProgress.labelText,
    TaskState.done.labelText,
    TaskState.undefined.labelText
  ];

  final String dropDownValue = TaskState.undefined.labelText;
}
