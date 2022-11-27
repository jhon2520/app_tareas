import 'package:flutter/material.dart';
import 'package:tareitas/router/app_routes_strings.dart';
import 'package:tareitas/screens/screens.dart';

class AppRouter{

  static Route<dynamic> generateRoutes(RouteSettings settings){

      switch (settings.name) {
        case AppRoutesString.homePage:
          //*final String ejemploArgumento = settings.arguments as String => se pasaría por el constructor
          return MaterialPageRoute(builder: (_)=>  const HomeScreen());
        case AppRoutesString.createTaskPage:
          return MaterialPageRoute(builder: (_)=>  const NewTaskScreen());
        default:
        //** TODO: retornar un loading page
        return MaterialPageRoute(builder: (_)=> const HomeScreen());
      }



  }

}