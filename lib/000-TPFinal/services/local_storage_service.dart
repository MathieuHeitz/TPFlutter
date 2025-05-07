import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class LocalStorageService {
  static const _key = 'tasks';

  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final taskListJson = tasks.map((t) => t.toJson()).toList();
    prefs.setString(_key, jsonEncode(taskListJson));
  }

  static Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString != null) {
      final decoded = jsonDecode(jsonString) as List;
      return decoded.map((e) => Task.fromJson(e)).toList();
    }
    return [];
  }
}
