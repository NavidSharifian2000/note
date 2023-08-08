import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:notr/edit_task_screen.dart';
import 'package:notr/task.dart';

class Itemcard extends StatefulWidget {
  Itemcard({super.key, required this.task});
  Task task;
  @override
  State<Itemcard> createState() => _ItemcardState();
}

class _ItemcardState extends State<Itemcard> {
  bool ontaped = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ontaped = widget.task.isdone;
  }

  @override
  Widget build(BuildContext context) {
    return gettasak();
  }

  gettasak() {
    return GestureDetector(
        onTap: () {
          setState(() {
            ontaped = !ontaped;
            widget.task.isdone = ontaped;
            widget.task.save();
          });
        },
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.amber),
            width: double.infinity,
            height: 132,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                                value: ontaped,
                                onChanged: (ischeacked) {
                                  setState(() {
                                    ontaped = !ischeacked!;
                                  });
                                }),
                            Text(widget.task.name)
                          ],
                        ),
                        Text(
                          widget.task.subtitle,
                          style: TextStyle(
                              fontFamily: "shabnam",
                              overflow: TextOverflow.ellipsis),
                        ),
                        Spacer(),
                        gettitels()
                      ],
                    ),
                  ),
                  Image.asset(widget.task.tasktype.Image),
                ],
              ),
            ),
          ),
        ));
  }

  Widget gettitels() {
    return Row(
      children: [
        Container(
          width: 90,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (widget.task.time.hour).toString() +
                      ":" +
                      (widget.task.time.minute).toString(),
                  style: TextStyle(fontFamily: "shabnam"),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: Image.asset("images/icon_time.png"),
                )
              ],
            ),
          ),
        ),
        Container(
          width: 90,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => edittask_screen(
                        task: widget.task,
                      )));
            },
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("edit"),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset("images/icon_edit.png")
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
