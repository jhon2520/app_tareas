import 'package:flutter/material.dart';
import 'package:tareitas/consts/app_const.dart';
import 'package:tareitas/router/app_routes_strings.dart';
import '../widgets/task_list.dart';
import '../widgets/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: AppConst.backgrounColor,
      body: Stack(children:[ 
        const Positioned(
          top: -300,
          left: 0,
          child:_BackgroundDecorator()
        ),
        Positioned(
          top: size.height * 0.1,
          left: 0,
          child: const CustomAnimatedContainer(orientarion: 1.0,)
        ),
        Positioned(
          bottom: size.height * 0.1,
          left: 0,
          child: const CustomAnimatedContainer(orientarion: -1.0,)
        ),
        const Positioned(
          bottom: -300,
          left: 0,
          child: _BackgroundDecorator(),
        ),
        TasksList(size: size)
        ]
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppConst.whiteColor,
          onPressed: () => {
            Navigator.pushNamed(context, AppRoutesString.createTaskPage)
          },
          child: const Icon(Icons.add,color: AppConst.backgrounColor,)),
    );
  }


}

class _BackgroundDecorator extends StatelessWidget {
  const _BackgroundDecorator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 35,
      child: Container(
        decoration:  BoxDecoration(
          color: Colors.black54,
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          border: Border.all(color: AppConst.whiteColor)
        ),
        width: 400,
        height: 400,
      ),
    );
  }
}
