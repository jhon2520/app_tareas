
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:tareitas/models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvents,TasksState>{

  TaskBloc():super( TaksInitState()){

    on<ActivateTaskEvent>((event, emit) {

      List<TaskModel> listAux = [...[event.newTaks], ...state.taks ?? []];
      emit(TaskSetState( newTaksList: listAux,newCurrentTaks: state.currentTaks));
      
    },);


    on<SetCurrentTaskEvent>((event, emit) {


      emit(TaskSetState(newCurrentTaks: event.currentTask,newTaksList: state.taks));
    },);

    on<DeleteTaskEvent>((event, emit) {
      
      List<TaskModel>? newList = state.taks?.where((element) => element.taskId != event.idTaskToDelete).toList();

      emit(TaskSetState(newTaksList: newList));

    },);

    on<EditTaskEvent>((event, emit) {
      
      TaskModel newtask = event.taskToEdit;

      List<TaskModel> newTasks = state.taks!.map(( e)=>
        e.taskId == newtask.taskId ? newtask : e  
      ).toList();

      emit(TaskSetState(newTaksList: newTasks, newCurrentTaks: state.currentTaks));

    },);

  }
  
}