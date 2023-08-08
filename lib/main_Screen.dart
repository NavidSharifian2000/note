import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:notr/Itemcard.dart';
import 'package:notr/add_task_screen.dart';
import 'package:notr/edit_task_screen.dart';
import 'package:notr/task.dart';

class main_screen extends StatefulWidget {
  const main_screen({super.key});

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  bool ontaped = false;
  bool fabvisibel = true;
  String text = "";
  var controller = TextEditingController();
  var box = Hive.box("names");
  var taskbox = Hive.box<Task>('taskbox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ValueListenableBuilder(
                valueListenable: taskbox.listenable(),
                builder: (context, value, child) {
                  return NotificationListener<UserScrollNotification>(
                      onNotification: (Notification) {
                        if (Notification.direction == ScrollDirection.forward) {
                          setState(() {
                            fabvisibel = false;
                          });
                        }
                        if (Notification.direction == ScrollDirection.reverse) {
                          setState(() {
                            fabvisibel = true;
                          });
                        }
                        return true;
                      },
                      child: ListView.builder(
                        itemCount: taskbox.values.length,
                        itemBuilder: (BuildContext context, int index) {
                          var task = taskbox.values.toList()[index];
                          print(task.tasktype.title);
                          return getListItem(task);
                        },
                      ));
                })),
        floatingActionButton: Visibility(
          visible: fabvisibel,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => addtask_screen()));
            },
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
          ),
        ));
  }

  Widget getListItem(Task task) {
    return Dismissible(
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => edittask_screen(
                      task: task,
                    )));
          } else {
            task.delete();
          }
        },
        key: UniqueKey(),
        onDismissed: (DismissDirection direction) {},
        child: Itemcard(task: task));
  }
}
