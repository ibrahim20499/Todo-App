import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/util/bloc/cubit.dart';

class SchadularItem extends StatelessWidget {
  List<Map?> item;
  final DateTime dateTime;
   SchadularItem({Key? key, required this.item, required this.dateTime}) : super(key: key);

  DateTime _selectedDate = DateTime.parse(DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: item.length,
        itemBuilder: (context, index) {
          var  task = AppBloc.get(context).allTasks;
          if (item[index]!['date']== DateFormat.yMMMd().format(dateTime)) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0,vertical: 10),
              child: Center(
                child: Container(
                  height: 100,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),

                  decoration: BoxDecoration(
                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item[index]!['startTime'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item[index]!['title'],
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          item[index]!['status'] == 'completed'
                              ? IconButton(
                            onPressed: () {
                              AppBloc.get(context).changeStatus(
                                status: 'uncompleted',
                                id: item[index]!['id'],
                              );
                            },
                            icon: const Icon(
                              Icons.check_circle_outline_sharp,
                              color: Colors.white,
                              size: 35,
                            ),
                          )
                              : IconButton(
                            onPressed: () {
                              AppBloc.get(context).changeStatus(
                                status: 'completed',
                                id: item[index]!['id'],
                              );
                            },
                            icon: const Icon(
                              Icons.radio_button_unchecked_outlined,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),


                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
