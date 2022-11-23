part of "task_bloc.dart";

@immutable
abstract class TaskEvents{}

//*Activar tarea
class ActivateTaskEvent extends TaskEvents{

    final TaskModel newTaks;
    ActivateTaskEvent(this.newTaks);

}


class SetCurrentTaskEvent extends TaskEvents{

  final TaskModel currentTask;

  SetCurrentTaskEvent(this.currentTask);
}