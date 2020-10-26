import 'CTask.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference _taskCalendar =
      FirebaseFirestore.instance.collection('Task');
  Future addTask(Task task) async {
    try {
      await _taskCalendar.add(task.toJson());
      return true;
    } catch (e) {
      return e.toString();
    }
  }
}

