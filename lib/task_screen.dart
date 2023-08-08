import 'package:flutter/material.dart';

class task_screen extends StatefulWidget {
  const task_screen({super.key});

  @override
  State<task_screen> createState() => _task_screenState();
}

class _task_screenState extends State<task_screen> {
  ValueNotifier mobser = new ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: mobser,
              builder: (context, value, child) {
                return Text(value.toString());
              }),
          ElevatedButton(
              onPressed: () {
                mobser.value = mobser.value + 1;
              },
              child: Text("add"))
        ],
      )),
    );
  }
}
