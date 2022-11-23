part of "task_bloc.dart";


abstract class TasksState{

  final bool existTask;
  final List<TaskModel>? taks;
  final TaskModel? currentTaks;



  const TasksState({this.existTask = false,this.taks, this.currentTaks});

}

class TaksInitState extends TasksState{
  

  TaksInitState():super(existTask: false, taks: null,currentTaks: TaskModel());

}

class TaskSetState extends TasksState{

  final List<TaskModel>? newTaksList;


  const TaskSetState({this.newTaksList}):super(existTask: true,taks: newTaksList,);

}

class TaskSetProgressState extends TasksState{

  final TaskModel? newCurrentTask;
  TaskSetProgressState({this.newCurrentTask}):super(currentTaks: newCurrentTask);
}
