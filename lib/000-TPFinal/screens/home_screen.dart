import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';
import '../utils/constants.dart';
import '../data/task_data.dart';

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
          ),),
          actions: [
          PopupMenuButton<SortType>(
          onSelected: (SortType selected) {
        Provider.of<TaskData>(context, listen: false).setSortType(selected);
  },
    itemBuilder: (context) => [
    const PopupMenuItem(
    value: SortType.name,
    child: Text('Trier par nom'),
    ),
    const PopupMenuItem(
    value: SortType.isDone,
    child: Text('Trier par statut'),
    ),
    ],
      ),
    ],
    ),
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
