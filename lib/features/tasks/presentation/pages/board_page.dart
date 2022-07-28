import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/util/bloc/states.dart';
import 'package:todo_app/features/tasks/presentation/widgets/all_task_item.dart';
import 'package:todo_app/features/schedule/presentation/pages/schedule_page.dart';
import 'package:todo_app/features/tasks/presentation/widgets/uncompleted_task_widget.dart';

import '../../../add_task/presentation/pages/add_task_page.dart';
import '../widgets/all_tasks_widget.dart';
import '../widgets/completed_task_widget.dart';

import '../../../../core/util/bloc/cubit.dart';
import '../../../../core/util/widgets/my_button.dart';
import '../widgets/favorite_task_widget.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController =  TabController(length: 4, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      // Do whatever you want based on the tab index
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                             const Text(
                               "Board",
                               textAlign: TextAlign.left,
                               style: TextStyle(
                                   fontSize: 22,
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold),
                             ),

                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SchadularPage(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.schedule,
                                color: Colors.black,
                                size: 27,
                              ),
                            ),

                          ],
                        ),
                      ),

                      Divider(
                        height: 1,
                        thickness: 3,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.grey.shade200,
                      ),
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        controller: _tabController,
                        indicatorWeight: 5,
                        indicatorColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        isScrollable: true,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.black,

                        tabs: const [
                          Tab(
                            child: Text(
                              "All",
                              style: TextStyle(
                                  //color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          Tab(
                              child: Text("Completed",
                                  style: TextStyle(
                                      //color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))),
                          Tab(
                            child: Text(
                              "Uncompleted",
                              style: TextStyle(
                                  //color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Favorite",
                              style: TextStyle(
                                  //color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ],

                        //unselectedLabelStyle: TextStyle(color: Colors.teal),
                      ),
                      Divider(
                        height: 1,
                        thickness: 3,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.grey.shade200,
                      ),


                      Expanded(
                        child: TabBarView(
                          children:  const [
                            AllTasksScreen(),
                            //Expanded(child: AllTasksScreen()),
                            //Text('Person'),
                            CompletedTasksScreen(),
                            UnCompletedTasksScreen(),
                            FavoriteTasksScreen(),
                          ],
                          controller: _tabController,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          //margin: const EdgeInsets.all(5),
                          padding: EdgeInsets.only(left: 25, right: 25,bottom: 50),
                          width: double.infinity,
                          child:  MyButton(
                              text: "Add a Task",
                              radius: 15,
                              textColor: Colors.grey.shade200,
                              buttonColor: Colors.teal.shade500,
                              onpressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddTask(),
                                  ),
                                );
                              },
                              fontsize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

}
