import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/local_storage_service.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  int _nextId = 0;

  List<Task> get tasks => _tasks;

  Future<void> loadTasks() async {
    _tasks = await LocalStorageService.loadTasks();
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    LocalStorageService.saveTasks(_tasks);
    notifyListeners();
  }

  void updateTask(Task updatedTask) {
    final index = _tasks.indexWhere((t) => t.id == updatedTask.id);

    if (index != -1) {
      _tasks[index] = Task(
        id: updatedTask.id,
        title: updatedTask.title,
        isDone: !updatedTask.isDone,
      );

      LocalStorageService.saveTasks(_tasks);
      notifyListeners();
    }
  }


  void deleteTask(Task task) {
    _tasks.remove(task);
    LocalStorageService.saveTasks(_tasks);
    notifyListeners();
  }
}
