import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareitas/screens/taks_screen.dart';
import 'package:tareitas/state/task_bloc/task_bloc.dart';

import 'models/task_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> TaskBloc()..add(SetCurrentTaskEvent(TaskModel())))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false ,
        title: 'Material App',
        home: TaskPage()
      ),
    );
  }
}
   