import 'package:flutter/animation.dart';
import 'package:tareitas/utils/enums/task_state_enum.dart';

class TaskModel{

  String? taskId;
  String? titulo;
  String? descripcion;
  String? date;
  String? state;
  Color? taskColor;

  TaskModel({
    this.taskId,
    this.titulo,
    this.descripcion,
    this.date,
    this.state,
    this.taskColor
  });
  
  TaskModel copyWith({
  String? taskId,
  String? titulo,
  String? descripcion,
  String? date,
  String? state,
  Color? taskColor,
  }){
    return TaskModel(
      taskId: taskId ?? this.taskId,
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
      date: date ?? this.date,
      state: state ?? this.state,
      taskColor: taskColor ?? this.taskColor,
    );
  }

}