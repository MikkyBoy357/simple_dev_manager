import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_dev_manager/models/model.dart';
import 'package:simple_dev_manager/ui/widgets/edit_card.dart';

class Edit extends StatelessWidget {
  final TextEditingController nameTEC = TextEditingController();
  final TextEditingController stackTEC = TextEditingController();
  final TextEditingController expTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
            ),
          ),
          Container(height: 50),
          EditCard(
            title: 'Code Name',
            subtitle: 'Name',
            controler: nameTEC,
          ),
          EditCard(
            title: 'Stack',
            subtitle: 'Frontend',
            controler: stackTEC,
          ),
          EditCard(
            title: 'Experience',
            subtitle: '2 Years',
            controler: expTEC,
          ),
          EditCard(
            title: 'Tools',
            subtitle: 'Figma, Adobe XD, Illustrator',
            // controler: expTEC,
          ),
          // Container(height: 50),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: TextField(
          //     controller: expTEC,
          //     decoration: InputDecoration(hintText: '2years'),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(50.0),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.black),
          ),
          color: Colors.white,
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
      Task task = Task(name: name, experience: exp, stack: stack);
      Navigator.of(context).pop(task);
    }
  }
}
