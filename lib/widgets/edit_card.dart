import 'package:flutter/material.dart';
import 'package:simple_dev_manager/const.dart';

class EditCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const EditCard({
    Key key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 15),
            child: Text(
              title,
              style: Const.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.green,
                ),
                Container(
                  width: 10.0,
                ),
                Text(
                  subtitle,
                  style: Const.subtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
