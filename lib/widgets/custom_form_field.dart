import 'package:flutter/material.dart';

import '../consts/app_const.dart';

class CustomFormField extends StatelessWidget {

  final String labelField;
  final void Function() onPressedIcon;
  final TextEditingController? controller;
  final bool? isMultiline;
  
  const CustomFormField({
    Key? key,
    required this.labelField,
    required this.onPressedIcon,
    this.isMultiline,
    this.controller
    }) : super(key: key);


  
  @override
  Widget build(BuildContext context) {

  final fontsyle = AppConst.fontStyle.copyWith(color: AppConst.whiteColor, fontSize: 14);

    return SizedBox(
      height: isMultiline != null && isMultiline == true ? 80 : 50,
      child: TextFormField(
                      controller: controller,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: isMultiline == true ? TextInputType.multiline: TextInputType.text,
                      maxLines: isMultiline == true ? 4 : 1,
                      
                      style: fontsyle,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close,color: AppConst.whiteColor,size: 16,),
                          onPressed: onPressedIcon
                          ),
                        suffixIconColor: AppConst.whiteColor,
                        label: Text(labelField,
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
    );
  }
}