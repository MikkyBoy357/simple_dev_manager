import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_dev_manager/models/model.dart';
import 'package:simple_dev_manager/widgets/edit_card.dart';

class Edit extends StatelessWidget {
  final TextEditingController nameTEC = TextEditingController();
  final TextEditingController stackTEC = TextEditingController();
  final TextEditingController expTEC = TextEditingController();
  final Task task;

  Edit({this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text(
          'Edit',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 74,
              backgroundColor: Colors.blue,
            ),
          ),
          Container(height: 50),
          EditCard(
            title: 'Code Name',
            subtitle: task.name,
            controler: nameTEC,
          ),
          EditCard(
            title: 'Stack',
            subtitle: task.stack,
            controler: stackTEC,
          ),
          EditCard(
            title: 'Experience',
            subtitle: task.experience,
            controler: expTEC,
          ),
          EditCard(
            title: 'Tools',
            subtitle: 'Figma, Adobe XD, Illustrator',
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(50.0),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.black),
          ),
          padding: EdgeInsets.all(8.0),
          onPressed: () {
            _onSubmittedHandler(context);
            print(nameTEC);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              "SAVE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onSubmittedHandler(BuildContext context) {
    String name = nameTEC.text.trim();
    String stack = stackTEC.text.trim();
    String exp = expTEC.text.trim();
    if (name.length == 0) {
      Navigator.of(context).pop();
    } else if (stack.length == 0) {
      Navigator.of(context).pop();
    } else if (exp.length == 0) {
      Navigator.of(context).pop();
    } else {
      task.name = name;
      task.experience = stack;
      task.stack = exp;

      Navigator.of(context).pop(task);
    }
  }
}
