import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/core/util/bloc/states.dart';
import 'package:path/path.dart' as p;

class AppBloc extends Cubit<AppStates> {
  AppBloc() : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);

  late Database database;
  void createDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'demo.db');

    openAppDatabase(path: path);
    emit(AppDatabaseCreated());
  }

  void openAppDatabase({required String path}) async {
     await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, startTime TEXT, endTime TEXT, status TEXT, favorite Text)');
        debugPrint("TableCreated");
        emit(AppDatabaseTableCreated());
      },
      onOpen: (Database db) {
        debugPrint("AppDatabaseOpened");
        database = db;
        getData(database);
      },
    );
  }


  void insertData({required String title,
    required String startTime,
    required String endTime,
    required String date})  async{
     await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO tasks(title, date, startTime, endTime, status, favorite) VALUES("$title","$date","$startTime", "$endTime", "uncompleted", "unfavorite")').then((value) {
          debugPrint("Task Data Inserted");
          getData(database);
          emit(AppDatabaseTaskCreated());
        });
     });
  }

  List<Map> allTasks = [];
  List<Map> completedTasks = [];
  List<Map> uncompletedTasks = [];
  List<Map> favoriteTasks = [];

  void getData(database) async {
    allTasks = [];
    completedTasks = [];
    uncompletedTasks = [];
    favoriteTasks = [];
    emit(AppDatabaseLoading());
    await database.rawQuery('SELECT * FROM tasks').then((value) {
      debugPrint("Tasks Data Fetched");
      value.forEach((element) {
        print(element['id']);
          allTasks.add(element);
          if (element['favorite'] == 'favorite') {
        favoriteTasks.add(element);
        }
        if (element['status'] == 'completed') {
          completedTasks.add(element);
        } else if (element['status'] == 'uncompleted') {
          uncompletedTasks.add(element);
        }
      });
      //tasks = value;
      debugPrint(allTasks.toString());
      emit(AppDatabaseTasks());

    });
  }

  void changeStatus({
    required String status,
    required int id,
  }) async{
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      [status, id],
    ).then((value) {
      getData(database);
      emit(AppDatabaseTasksStatus());
    });
  }
  void changeFavorite({
    required String favorite,
    required int id,
  }) async{
    database.rawUpdate(
      'UPDATE tasks SET favorite = ? WHERE id = ?',
      [favorite, id],
    ).then((value) {
      getData(database);
      emit(AppDatabaseTasksStatus());
    });
  }
  void deleteData({
    required int id,
  }) async{
    database.rawDelete(
      'DELETE FROM tasks WHERE id = ?',
      [id],
    ).then((value) {
      getData(database);
      emit(AppDatabaseTasksDeleted());
    });
  }
  void updateData() {}
}
