import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'task_type.g.dart';

@HiveType(typeId: 6)
class taskType {
  taskType({required this.title, required this.Image, required this.tasktype});
  @HiveField(0)
  String title;
  @HiveField(1)
  String Image;
  @HiveField(2)
  Enum tasktype;
}
