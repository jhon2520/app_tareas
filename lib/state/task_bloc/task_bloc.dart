import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:tareitas/models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvents,TasksState>{

  TaskBloc():super( TaksInitState()){

    on<ActivateTaskEvent>((event, emit) {

      log("Se activó usuario");
      List<TaskModel> listAux = [...[event.newTaks], ...state.taks ?? []];
      emit(TaskSetState( newTaksList: listAux));
      
    },);


    on<SetCurrentTaskEvent>((event, emit) {


      emit(TaskSetProgressState(newCurrentTask: event.currentTask));
      //log("titulo: ${event.currentTask.titulo} Description ${event.currentTask.descripcion} id ${event.currentTask.taskId} state: ${event.currentTask.state} date: ${event.currentTask.date} color: ${event.currentTask.taskColor} ");
    },);

    on<DeleteTaskEvent>((event, emit) {
      
      List<TaskModel>? newList = state.taks?.where((element) => element.taskId != event.idTaskToDelete).toList();

      emit(TaskSetState(newTaksList: newList));

    },);

  }
  
}