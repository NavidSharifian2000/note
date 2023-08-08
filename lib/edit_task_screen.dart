import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notr/getItemTaskType.dart';
import 'package:notr/main_Screen.dart';
import 'package:notr/task.dart';
import 'package:notr/task_type.dart';
import 'package:notr/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

class edittask_screen extends StatefulWidget {
  edittask_screen({super.key, required this.task});
  Task task;
  @override
  State<edittask_screen> createState() => _edittask_screenState();
}

class _edittask_screenState extends State<edittask_screen> {
  DateTime? _timer;
  var indexofitemselected;
  FocusNode negahban1 = new FocusNode();
  FocusNode negahban2 = new FocusNode();
  TextEditingController? controlleredittext1;
  TextEditingController? controlleredittext2;
  final taskbox = Hive.box<Task>("taskbox");
  @override
  void initState() {
    super.initState();
    controlleredittext1 = new TextEditingController(text: widget.task.name);
    controlleredittext2 = new TextEditingController(text: widget.task.subtitle);

    var index = getlistitem().indexWhere((element) {
      return element.tasktype == widget.task.tasktype.tasktype;
    });
    indexofitemselected = index;

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
            child: Column(children: [
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
                          color:
                              negahban1.hasFocus ? Colors.amber : Colors.amber),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(color: Colors.pink, width: 3.0)),
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
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
                          color:
                              negahban2.hasFocus ? Colors.blue : Colors.blue),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(color: Colors.pink, width: 3.0)),
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ))),
      ),
      CustomHourPicker(
          title: "زمانت رو انتخاب کن",
          negativeButtonText: "اوکی نکن",
          positiveButtonText: "اوکی کن",
          elevation: 2,
          onPositivePressed: (context, time) {
            _timer = time;
          },
          onNegativePressed: (context) {
            print('onNegative');
          }),
      getItemsTasksType(task: widget.task,),
      Spacer(),
      ElevatedButton(
        onPressed: () {
          edittask(controlleredittext1!.text, controlleredittext2!.text,
              getlistitem()[indexofitemselected]);
          Navigator.of(context)
              .pop(MaterialPageRoute(builder: (context) => main_screen()));
        },
        child: Text("ادیت کن"),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))),
      )
    ])));
  }

  void edittask(String name, String subtitle, taskType tasktype) {
    widget.task.name = name;
    widget.task.subtitle = subtitle;
    widget.task.time = _timer!;
    widget.task.tasktype = tasktype;
    widget.task.save();
  }

  Widget getItemtypework(taskType tasktype, int index) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color:
                  (indexofitemselected == index) ? Colors.amber : Colors.black,
              width: 2),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: 140,
      child: Column(
        children: [
          Image.asset(tasktype.Image.toString()),
          Text(tasktype.title.toString())
        ],
      ),
    );
  }
}
