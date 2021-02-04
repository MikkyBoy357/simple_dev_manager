import 'package:sembast/sembast.dart';

class Task {
  int key;
  bool done;
  String name;
  String experience;
  String stack;

  Task({this.key, this.name, this.experience, this.stack, this.done = false});

  Task.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        experience = json['experience'] as String,
        stack = json['stack'] as String,
        done = json['done'] as bool;

  Map<String, dynamic> toJson() => {
        'name': name,
        'experience': experience,
        'stack': stack,
        'done': done,
      };

  Task.fromDatabase(RecordSnapshot<int, Map<String, dynamic>> snapshot)
      : name = snapshot.value['name'] as String,
        experience = snapshot.value['experience'] as String,
        stack = snapshot.value['stack'] as String,
        done = snapshot.value['done'] as bool,
        key = snapshot.key;

  @override
  String toString() {
    return "Task { KEY: $key, NAME: $name, EXPERIENCE: $experience, STACK: $stack DONE: $done }";
  }
}
