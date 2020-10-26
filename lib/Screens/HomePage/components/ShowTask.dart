import 'package:Calendar/Utilities/CTask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskCompleted extends StatelessWidget {
  const TaskCompleted({
    Key key, 
    @required
    this.task,
    
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: (task.description == "") ? 3.5 : 0
            ),
            child: Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: Colors.green,
              size: 30
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white)),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      DateFormat('MMMM dd').format(task.date),
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "${task.startTime ~/ 60}h${task.startTime % 60} \u{2192} ${task.endTime ~/ 60}h${task.endTime % 60}",
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                    SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.5, right: 2),
                      child: Icon(CupertinoIcons.location,
                          color: Colors.white70, size: 12),
                    ),
                    Text(
                      task.location,   
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    )
                  ],
                ),
                if (task.description != "")
                  Column(
                    children: [
                      SizedBox(height: 3),
                      Text(
                        task.description,
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TaskUncompleted extends StatelessWidget {
  const TaskUncompleted({
    Key key, 
    @required
    this.task,
    
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: (task.description == "") ? 3.5 : 0
            ),
            child: Icon(
              CupertinoIcons.clock,
              color: Colors.orange[700],
              size: 30
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white)),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      DateFormat('MMMM dd').format(task.date),
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "${task.startTime ~/ 60}h${task.startTime % 60} \u{2192} ${task.endTime ~/ 60}h${task.endTime % 60}",
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                    SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.5, right: 2),
                      child: Icon(CupertinoIcons.location,
                          color: Colors.white70, size: 12),
                    ),
                    Text(
                      task.location,   
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    )
                  ],
                ),
                if (task.description != "")
                  Column(
                    children: [
                      SizedBox(height: 3),
                      Text(
                        task.description,
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}