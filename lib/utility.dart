import 'package:notr/enum_tasktypes.dart';
import 'package:notr/task_type.dart';

List<taskType> getlistitem() {
  var list = [
    taskType(
        title: "hardwork",
        Image: "images/hardwork.png",
        tasktype: TaskTypeEnum.working),
    taskType(
        title: "miting",
        Image: "images/miting.png",
        tasktype: TaskTypeEnum.date),
    taskType(
        title: "fouces",
        Image: "images/fouces.png",
        tasktype: TaskTypeEnum.Focus),
  ];
  return list;
}
