import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/util/widgets/input_field.dart';
import 'package:todo_app/core/util/widgets/my_form.dart';

import '../../../../core/util/bloc/cubit.dart';
import '../../../../core/util/widgets/my_button.dart';
import '../../../../core/util/widgets/my_button.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  late DateTime pickedDate;
  late TimeOfDay time;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }
  String _startTime = "8:30 AM";
  String _endTime = "9:30 AM";
  String _selectedRemind = "1 day before";
  List<String> remindList = [
    "1 day before",
    "1 hour before",
    "30 min before",
    "10 min before",
  ];
  String _selectedRepeat = 'None';
  List<String> repeatList = [
    'None',
    'Daily',
    'Weekly',
    'Monthly',
  ];
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController starttimeController = TextEditingController();
  TextEditingController endtimeController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _pickDate() async {
      DateTime? date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 10),
        initialDate: pickedDate,
        helpText: "Select Date",
      );
      if (date != null) {
        setState(() {
          pickedDate = date;
          dateController.text = DateFormat.yMMMd()
              .format(date)
              .toString();
        });
      }
    }

    _pickTime() async {
      TimeOfDay? t = await showTimePicker(context: context, initialTime: time);

      if (t != null)
        setState(() {
          time = t;
        });
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
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
                        "Add task",
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         MyForm(
                          width: double.infinity,
                          text: "Title",
                          type: TextInputType.text,
                          hint: 'Task title',
                          controller: titleController ,
                           validate: (value) {
                             if (value!.isEmpty) {
                               return 'Title must not be empty';
                             }
                             return null;
                           },
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        MyForm(
                          controller: dateController,
                          type: TextInputType.datetime,
                           hint: DateFormat.yMd().format(pickedDate),
                           onTap: (){
                            _pickDate();
                          },
                          suffix: Icons.date_range_outlined,
                           width: double.infinity, text: 'Date',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Date must not be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: MyForm(
                                controller: starttimeController,
                                type: TextInputType.datetime,
                                hint: _startTime,

                                onTap: (){
                                  _getTimeFromUser(isStartTime: true);
                                },
                                suffix: Icons.access_time,
                                width: double.infinity, text: 'Start time',
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Start time must not be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: MyForm(
                                controller: endtimeController,
                                type: TextInputType.datetime,
                                hint: _endTime,
                                onTap: (){
                                  _getTimeFromUser(isStartTime: false);
                                },
                                suffix: Icons.access_time,
                                width: double.infinity, text: 'End time',
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'End Time must not be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            // Expanded(
                            //   child: InputField(
                            //     title: "End time",
                            //     text: "${time.hour}:${time.minute}",
                            //     widget: IconButton(
                            //       onPressed: () {
                            //         _pickTime();
                            //       },
                            //       icon: Icon(Icons.access_time),
                            //       // alignment: Alignment.,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        InputField(
                          title: "Remind",
                          text: "$_selectedRemind ",
                          widget: DropdownButton<String>(
                              //value: _selectedRemind.toString(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              iconSize: 32,
                              elevation: 4,
                              //style: subTitleTextStle,
                              underline: Container(height: 0),
                              onChanged: (newValue) async {
                                setState(() {
                                  _selectedRemind = newValue!;
                                });
                              },
                              items: remindList
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        InputField(
                          title: "Repeat",
                          text: "$_selectedRepeat",
                          widget: DropdownButton<String>(
                              //value: _selectedRemind.toString(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              iconSize: 32,
                              elevation: 4,
                              //style: subTitleTextStle,
                              underline: Container(height: 0),
                              onChanged: (newValue) async {
                                setState(() {
                                  _selectedRepeat = newValue!;
                                });
                              },
                              items: repeatList
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        MyButton(
                            text: "Create a Task",
                            radius: 15.0,
                            textColor: Colors.grey.shade300,
                            buttonColor: Colors.teal.shade400,
                            onpressed: () {
                              AppBloc.get(context).insertData(
                                title: titleController.text,
                                date: dateController.text,
                                startTime: starttimeController.text,
                                endTime: endtimeController.text,
                              );
                              debugPrint("${AppBloc.get(context).allTasks.toString()} kkjdmj");
                            },
                            fontsize: 16)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;
  _getTimeFromUser({ required bool isStartTime}) async {
    var _pickedTime = await _showTimePicker();
    print(_pickedTime.format(context));
    String _formatedTime = _pickedTime.format(context);
    print(_formatedTime);
    if (_pickedTime == null)
      print("time canceld");
    else if (isStartTime) {
      setState(() {
        _startTime = _formatedTime;
        starttimeController.text=_startTime;
      });
    } else if (!isStartTime) {
      setState(() {
        _endTime = _formatedTime;
        endtimeController.text=_endTime;
      });
      //_compareTime();
    }
  }

  _showTimePicker() async {
    return showTimePicker(
      initialTime:  TimeOfDay(hour: 8, minute: 30),
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
    );
  }
}
