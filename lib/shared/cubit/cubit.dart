import 'package:app00/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:app00/modules/done_tasks/done_tasks_screen.dart';
import 'package:app00/modules/new_tasks/new_tasks_screen.dart';
import 'package:app00/shared/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit <AppStates>{

  bool isDark = false;

  Database? database;
  List <Map> newTasks = [];
  List <Map> doneTasks = [];
  List <Map> archivedTasks = [];
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  int currentIndex = 0;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];


  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void changeIndex(int index){
    currentIndex = index;
    emit(AppChangBottomNavBarState());
  }

  void changBottomSheetState({
    required bool isShow,
    required IconData icon,
  })
  {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(ChangeBottomSheetState());
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('Database Created');
        database.execute('CREATE TABLE tasks ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'title TEXT, date TEXT, time TEXT, status TEXT)').then((value){
          print('Table Created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('Database Opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertIntoDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database!.transaction((txn) async {
      txn.rawInsert('INSERT INTO tasks (title, date,'
          ' time, status) VALUES("${title}", "${date}",'
          ' "${time}", "new")').then((value) {
            print('$value Inserted Successfully');
            emit(AppInsertDatabaseState());
            getDataFromDatabase(database);
          }).catchError((error) {
        print('Error When Insert New Record ${error.toString()}');
      });
      return null;
    });
  }

  void getDataFromDatabase(database)
  {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(GetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element){
        if(element['status'] == 'new')
          newTasks.add(element);
        else if(element['status'] == 'done')
          doneTasks.add(element);
        else
          archivedTasks.add(element);
      });

      emit(AppGetDatabaseState());
    });
  }

  void updateDate({
    required String status,
    required int id,
  }) {
    database!.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value) => {
      getDataFromDatabase(database),
      emit(AppUpdateDatabaseState()),
    });
  }

  void deleteDate({
    required int id,
  }) {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?',
    [id],
    ).then((value) => {
      getDataFromDatabase(database),
      emit(AppDeleteDatabaseState()),
    });
  }

  void changeAppMode(){
      isDark = !isDark;
      emit(AppChangeModeState());
    }
}