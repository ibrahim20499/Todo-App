import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/util/bloc/states.dart';
import 'package:todo_app/features/schedule/presentation/widgets/schadular_item.dart';
import 'package:todo_app/features/schedule/presentation/pages/schedule_page.dart';

import '../../../../core/util/bloc/cubit.dart';



class SchadularTasksScreen extends StatelessWidget {
  final DateTime dateTime;
  const SchadularTasksScreen({Key? key, required this.dateTime,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state){},
      builder: (context, state){

        var tasks = AppBloc.get(context).allTasks;
        return SchadularItem(item: tasks, dateTime: dateTime,);

        //return Container();
      },

    );
  }
}