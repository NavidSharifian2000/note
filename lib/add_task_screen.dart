import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notr/getItemTaskType.dart';
import 'package:notr/main_Screen.dart';
import 'package:notr/task.dart';
import 'package:notr/task_type.dart';
import 'package:notr/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

class addtask_screen extends StatefulWidget {
  addtask_screen({super.key});
  @override
  State<addtask_screen> createState() => _addtask_screenState();
}

class _addtask_screenState extends State<addtask_screen> {
  int? indexofitemselected;
  DateTime? _time;
  FocusNode negahban1 = new FocusNode();
  FocusNode negahban2 = new FocusNode();
  TextEditingController controlleredittext1 = new TextEditingController();
  TextEditingController controlleredittext2 = new TextEditingController();
  final taskbox = Hive.box<Task>("taskbox");
  @override
  void initState() {
    super.initState();
    negahban1.addListener(() {
      if (negahban1.hasFocus == true) {
        setState(() {});
      }
      if (negahban1.hasFocus == false) {
        setState(() {});
      }
    });
    negahban2.addListener(() {
      if (negahban2.hasFocus == true) {
        setState(() {});
      }
      if (negahban2.hasFocus == false) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: controlleredittext1,
                      focusNode: negahban1,
                      decoration: InputDecoration(
                          label: Text(
                            "عنوان تسک",
                          ),
                          labelStyle: TextStyle(
                              color: negahban1.hasFocus
                                  ? Colors.amber
                                  : Colors.amber),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.pink, width: 3.0)),
                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ))),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: controlleredittext2,
                      maxLines: 2,
                      focusNode: negahban2,
                      decoration: InputDecoration(
                          label: Text(
                            " توضیحات",
                          ),
                          labelStyle: TextStyle(
                              color: negahban2.hasFocus
                                  ? Colors.blue
                                  : Colors.blue),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.pink, width: 3.0)),
                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ))),
          ),
          CustomHourPicker(
              title: "زمانت رو انتخاب کن",
              negativeButtonText: "اوکی نکن",
              positiveButtonText: "اوکی کن",
              elevation: 2,
              onPositivePressed: (context, time) {
                _time = time;
              },
              onNegativePressed: (context) {
                print('onNegative');
              }),
          getItemsTasksType(),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              addtask(controlleredittext1.text, controlleredittext2.text,
                  getlistitem()[indexofitemselected!]);
              Navigator.of(context)
                  .pop(MaterialPageRoute(builder: (context) => main_screen()));
            },
            child: Text("اضافه کن"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)))),
          )
        ]),
      ),
    );
  }

  void addtask(String name, String subtitle, taskType tasktype) {
    var task = new Task(
        name: name, subtitle: subtitle, time: _time!, tasktype: tasktype);
    taskbox.add(task);
  }
}
