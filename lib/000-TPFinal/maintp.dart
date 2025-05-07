import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/task_data.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final taskData = TaskData();
        taskData.loadTasks(); // charge les données au démarrage
        return taskData;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const HomeScreen(),
      ),
    );
  }
}
