import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/local_storage_service.dart';


enum SortType {name, isDone, noFilter}

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  SortType _sortType = SortType.noFilter;


//ancienne methode sans filtre
//   List<Task> get tasks => _tasks;

  //nouvelle methode utilisant un filtre

  List<Task> get tasks {
    List<Task> sortedTasks = [..._tasks];
    if (_sortType == SortType.name) {
      // tri alphabétique ici
      sortedTasks.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
    } else if (_sortType == SortType.isDone) {
      sortedTasks.sort((a, b) => a.isDone.toString().compareTo(b.isDone.toString()));
    } else {
      sortedTasks = _tasks;
    }
    return sortedTasks;
  }


  void setSortType(SortType type) {
    _sortType = type;
    notifyListeners();
  }

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
