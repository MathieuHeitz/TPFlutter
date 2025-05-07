import 'package:flutter/material.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(backgroundColor: AppColors.primaryColor,
          title: const Text('Mes Tâches',
            style: TextStyle(
              color: Colors.white
          ),)),
      body: const TaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => AddTaskScreen(),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: AppColors.lightColor,
      ),
    );
  }
}
