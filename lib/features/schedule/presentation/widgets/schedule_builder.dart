//
//
// import 'package:flutter/cupertino.dart';
// import 'package:todo_app/features/tasks/presentation/widgets/completed_task_item.dart';
// import 'package:todo_app/features/tasks/presentation/widgets/all_task_item.dart';
// import 'package:todo_app/features/tasks/presentation/widgets/uncompleted_task_item.dart';
//
// import 'features/tasks/presentation/widgets/favorite_task_item.dart';
//
// class SchadularBuilder extends StatelessWidget {
//   SchadularBuilder({Key? key, required this.taskStatus, required this.tasks}) : super(key: key);
//
//   List<Map> tasks;
//   String taskStatus;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         //
//         if (item!['date']== DateFormat.yMd().format(_selectedDate)) {
//           return
//         } else {
//           return Container();
//         }
//         //return TaskItem(item: tasks[index]);
//
//       },
//       itemCount: tasks.length,
//     );
//
//   }
// }