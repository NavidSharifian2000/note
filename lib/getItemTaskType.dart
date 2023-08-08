import 'package:flutter/material.dart';
import 'package:notr/task.dart';
import 'package:notr/task_type.dart';
import 'package:notr/utility.dart';

class getItemsTasksType extends StatefulWidget {
  getItemsTasksType({super.key, required this.task});

  Task task;
  @override
  State<getItemsTasksType> createState() => _getItemsTasksTypeState();
}

class _getItemsTasksTypeState extends State<getItemsTasksType> {
  var indexofitemselected;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var index = getlistitem().indexWhere((element) {
      return element.tasktype == widget.task.tasktype.tasktype;
    });
    indexofitemselected = index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: getlistitem().length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    setState(() {
                      indexofitemselected = index;
                    });
                  },
                  child: getItemtypework(getlistitem()[index], index));
            }));
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
