import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_dev_manager/databases/task_store.dart';
import 'package:simple_dev_manager/models/model.dart';
import 'package:simple_dev_manager/ui/screens/add/add.dart';
import 'package:simple_dev_manager/widgets/task_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TaskStore taskStore = TaskStore();

  List developers = ['Michael', 'success', 'Bukunmi', 'James', 'Stephen'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.white,
        title: Text(
          'DEVELOPERS',
          style: TextStyle(
            // color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              Task task = await Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Add()));

              if (task != null) {
                taskStore.save(task);
              }
            },
            child: Icon(
              Icons.add,
              // color: Colors.black,
            ),
          ),
          Container(
            width: 10,
          ),
          Icon(
            Icons.nightlight_round,
            // color: Colors.black,
          ),
          Container(
            width: 20,
          ),
        ],
      ),
      // body: ListView.builder(
      //   itemCount: developers.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       leading: CircleAvatar(
      //         radius: 25,
      //       ),
      //       title: Text(
      //         developers[index],
      //         style: Const.title,
      //       ),
      //       subtitle: Text(
      //         'Front End Developer',
      //         style: Const.subtitle,
      //       ),
      //       trailing: Wrap(
      //         children: [
      //           IconButton(
      //             color: Colors.black,
      //             icon: Icon(Icons.edit_outlined),
      //             onPressed: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) {
      //                     return Edit();
      //                   },
      //                 ),
      //               );
      //             },
      //           ),
      //           Container(
      //             width: 10,
      //           ),
      //           Icon(
      //             CupertinoIcons.delete,
      //             color: Colors.black,
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
      body: SafeArea(
        child: FutureBuilder(
          future: taskStore.stream(),
          builder: (context, AsyncSnapshot<Stream<List<Task>>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              Stream<List<Task>> _stream = snapshot.data;
              return StreamBuilder<List<Task>>(
                stream: _stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<Task> _taskList = snapshot.data;
                    if (_taskList.length == 0) {
                      TextTheme textTheme = Theme.of(context).textTheme;
                      return Center(
                        child: Text(
                          "No Data",
                          style: textTheme.headline6,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: _taskList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onLongPress: () {},
                            child: TaskItem(task: _taskList[index]),
                          );
                        },
                      );
                    }
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
