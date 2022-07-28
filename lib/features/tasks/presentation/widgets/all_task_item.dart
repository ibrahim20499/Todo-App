import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/core/util/bloc/cubit.dart';

class TaskItem extends StatelessWidget {
  Map? item;

  TaskItem({
    Key? key,
    this.item,
  }) : super(key: key);
  bool value = false;

  @override
  Widget build(BuildContext context) {
    // var x = AppBloc.get(context).changeStatus(status: 'completed', id: item!['id']);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
      child: Row(
        children: [
          item!['status'] == 'completed'
              ? IconButton(
                  onPressed: () {
                    AppBloc.get(context).changeStatus(
                      status: 'uncompleted',
                      id: item!['id'],
                    );
                  },

                  icon:  Icon(

                    Icons.check_box_rounded,
                    size: 35,
                    //color: Colors.blueAccent,
                    color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                )
              : IconButton(
                  onPressed: () {
                    AppBloc.get(context).changeStatus(
                      status: 'completed',
                      id: item!['id'],
                    );
                  },
                  icon:  Icon(
                    Icons.check_box_outline_blank_outlined,
                    size: 35,
                    //color: Colors.blueAccent,
                    color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                ),
          //const Icon(Icons.check_box_outline_blank_outlined),
          //       if(item!['status'] == 'all')AppBloc.get(context).changeStatus(
          // status: 'completed',
          // id: item!['id'],
          // );
          //       else if ()

          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Text(
              '${item!['title']}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: const [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Delete")
                  ],
                ),
              ),
              // PopupMenuItem 2
              PopupMenuItem(
                value: 2,
                // row with two children
                child: Row(
                  children: const [
                    Icon(Icons.favorite),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Favorite")
                  ],
                ),
              ),
            ],
            color: Colors.white,
            elevation: 2,
            // on selected we show the dialog box
            onSelected: (value) {
              // if value 1 show dialog
              if (value == 1) {
                AppBloc.get(context).deleteData(id: item!['id']);
                // if value 2 show dialog
              } else if (value == 2) {
                AppBloc.get(context).changeFavorite(
                  id: item!['id'], favorite: 'favorite',
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
