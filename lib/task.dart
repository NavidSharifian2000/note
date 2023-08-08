import 'package:hive_flutter/hive_flutter.dart';
import 'package:notr/task_type.dart';

part 'task.g.dart';

@HiveType(typeId: 5)
class Task extends HiveObject {
  Task(
      {required this.name,
      required this.subtitle,
      this.isdone = false,
      required this.time,
      required this.tasktype});
  @HiveField(0)
  String name;
  @HiveField(1)
  String subtitle;
  @HiveField(2, defaultValue: false)
  bool isdone;
  @HiveField(3)
  DateTime time;
  @HiveField(4)
  taskType tasktype;
}
