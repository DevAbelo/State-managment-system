import 'package:flutter/foundation.dart';
import '../models/task_model.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  String _generateId() => DateTime.now().millisecondsSinceEpoch.toString();

  void addTask({
    required String title,
    required String description,
    required DateTime deadline,
  }) {
    _tasks.add(Task(
      id: _generateId(),
      title: title,
      description: description,
      deadline: deadline,
    ));
    notifyListeners();
  }

  void toggleTask(String id) {
    final task = _tasks.firstWhere((t) => t.id == id);
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();
  }
}
