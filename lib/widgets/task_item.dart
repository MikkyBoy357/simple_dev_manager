import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:simple_dev_manager/const.dart';
import 'package:simple_dev_manager/databases/task_store.dart';
import 'package:simple_dev_manager/models/model.dart';
import 'package:simple_dev_manager/ui/screens/edit/edit.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  final TaskStore taskStore = TaskStore();

  TaskItem({this.task});

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  _onChangeHandler(bool newValue) {
    setState(() {
      widget.task.done = newValue;
      widget.taskStore.update(widget.task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.blue,
      ),
      title: Text(
        widget.task.name,
        style: Const.title,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.task.stack,
            style: TextStyle(
              fontSize: 14,
              // color: Colors.black,
            ),
          ),
          // Text(
          //   widget.task.experience,
          //   style: Const.subtitle,
          // ),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            // color: Colors.black,
            icon: Icon(Icons.edit_outlined),
            onPressed: () async {
              Task taskEdited = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Edit(task: widget.task),
                ),
              );
              if (taskEdited != null) {
                widget.taskStore.update(taskEdited);
              }
            },
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.delete,
              // color: Colors.black,
            ),
            onPressed: () {
              widget.taskStore.delete(widget.task);
            },
          )
        ],
      ),
    );
  }
}
