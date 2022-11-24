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
  final TaskModel? newCurrentTaks;


  const TaskSetState({this.newTaksList,this.newCurrentTaks}):super(existTask: true,taks: newTaksList,currentTaks: newCurrentTaks);

}

