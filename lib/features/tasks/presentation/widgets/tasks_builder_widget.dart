import 'package:flutter/cupertino.dart';
import 'all_task_item.dart';

class TaskBuilder extends StatelessWidget {
  TaskBuilder({Key? key, required this.tasks}) : super(key: key);

  List<Map> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return TaskItem(item: tasks[index]);
      },
      itemCount: tasks.length,
    );
  }
}
