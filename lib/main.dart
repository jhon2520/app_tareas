import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareitas/router/router.dart';
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
      child:  MaterialApp(
        supportedLocales: const [
          Locale("en","US"), 
          Locale("es","CO"), 
        ],
        debugShowCheckedModeBanner: false ,
        title: 'Material App',
        onGenerateRoute: AppRouter.generateRoutes,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white)
          )
        ),
      ),
    );
  }
}
