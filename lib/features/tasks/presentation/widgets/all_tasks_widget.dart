// import 'package:flutter/cupertino.dart';
// import 'package:todo_app/all_task_item.dart';
//
// import 'cubit.dart';
//
// class AllTasksScreen extends StatelessWidget {
//   const AllTasksScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         //scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//
//
//           //print(index);
//           return TaskItem(
//             item: AppBloc.get(context).allTasks[index],
//           );
//         },
//         itemCount:
//         AppBloc.get(context).allTasks.length);
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/util/bloc/states.dart';

import 'tasks_builder_widget.dart';
import '../../../../core/util/bloc/cubit.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state){},
      builder: (context, state){

        var tasks = AppBloc.get(context).allTasks;

        return TaskBuilder(tasks: tasks);
      },
    );
  }
}