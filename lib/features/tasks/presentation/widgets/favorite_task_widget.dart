import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/util/bloc/states.dart';

import 'tasks_builder_widget.dart';
import '../../../../core/util/bloc/cubit.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state){},
      builder: (context, state){

        var tasks = AppBloc.get(context).favoriteTasks;

        return TaskBuilder(tasks: tasks,);
      },
    );
  }
}