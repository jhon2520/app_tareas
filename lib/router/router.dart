import 'package:flutter/material.dart';
import 'package:tareitas/models/task_model.dart';
import 'package:tareitas/router/app_routes_strings.dart';
import 'package:tareitas/screens/screens.dart';

class AppRouter{

  static Route<dynamic> generateRoutes(RouteSettings settings){

      switch (settings.name) {
        case AppRoutesString.homePage:
          return MaterialPageRoute(builder: (_)=>  const HomeScreen(),);
        case AppRoutesString.createTaskPage:
          final TaskModel? task = settings.arguments as TaskModel?;
          return MaterialPageRoute(builder: (_)=>   NewTaskScreen(task:task));
        default:
        return MaterialPageRoute(builder: (_)=> const HomeScreen());
      }



  }

}

