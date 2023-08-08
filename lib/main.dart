import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notr/add_task_screen.dart';
import 'package:notr/enum_tasktypes.dart';
import 'package:notr/main_Screen.dart';
import 'package:notr/task.dart';
import 'package:notr/task_screen.dart';
import 'package:notr/task_type.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("names");
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(taskTypeAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());
  await Hive.openBox<Task>('taskbox');
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'shabnam'), home: main_screen());
  }
}
