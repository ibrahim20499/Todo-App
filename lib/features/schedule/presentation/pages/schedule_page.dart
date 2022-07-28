// ignore_for_file: prefer_const_constructors

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/util/bloc/cubit.dart';
import 'package:todo_app/features/schedule/presentation/widgets/schadular_item.dart';

import '../../../../core/util/widgets/my_button.dart';
import '../widgets/schedule_task_widget.dart';

class SchadularPage extends StatefulWidget {

  SchadularPage({Key? key}) : super(key: key);

  @override
  State<SchadularPage> createState() => _SchadularPageState();
}

class _SchadularPageState extends State<SchadularPage> {
  DateTime _selectedDate = DateTime.parse(DateTime.now().toString());
  late Map item;
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "Schedule",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 3,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.grey.shade200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: ClipRRect(
                    // borderRadius: BorderRadius.circular(30.0),
                    child: DatePicker(
                      DateTime.now(),
                      width: 65,
                      height: 85.0,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Colors.green.shade700,
                      selectedTextColor: Colors.white,
                      dateTextStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      dayTextStyle: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.bold,
                      ),
                      onDateChange: (date) {
                        // New date selected
                        setState(
                          () {
                            _selectedDate = date;
                          },
                        );
                      },
                    ),
                  ),
                ),
                Divider(
                  height: 50,
                  thickness: 3,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.grey.shade200,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('EEEE').format(_selectedDate),
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      Text(
                        DateFormat.yMMMMd().format(_selectedDate),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                 Expanded(child: SchadularTasksScreen(dateTime: _selectedDate,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
