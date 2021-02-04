import 'package:flutter/material.dart';
import 'package:simple_dev_manager/const.dart';

class EditCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextEditingController controler;
  const EditCard({
    Key key,
    this.title,
    this.subtitle,
    this.controler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 55.0, top: 15),
            child: Text(
              title,
              style: Const.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.green,
                  ),
                ),
                Container(
                  width: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width - 100,
                    child: TextField(
                      controller: controler,
                      decoration: InputDecoration.collapsed(
                        hintText: subtitle,
                        // labelStyle: Const.subtitle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
