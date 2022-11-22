import 'package:tareitas/utils/task_state_enum.dart';

class TaskModel{

  String? taskId;
  String? titulo;
  String? descripcion;
  String? date;
  TaskState? state;

  TaskModel({
    this.taskId,
    this.titulo,
    this.descripcion,
    this.date,
    this.state
  });


}