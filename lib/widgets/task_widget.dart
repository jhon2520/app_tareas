import 'package:flutter/material.dart';
import 'package:tareitas/consts/app_const.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
      color: AppConst.taksBackgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(20))

      ),
      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      padding: const EdgeInsets.all(10),
      height: 100,
      child: const _CardTaskContainer(),
    );
  }
}

class _CardTaskContainer extends StatelessWidget {
  const _CardTaskContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppConst.labelTitle, style: AppConst.fontStyleBold),
            Text(AppConst.labelDescription, style: AppConst.fontStyleBold),
            Text(AppConst.labelState,style: AppConst.fontStyleBold,),

          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppConst.deleteColor,
              child: IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.delete, color: AppConst.taksBackgroundColor,)))
          ],
        )
      ],
    );
  }
}