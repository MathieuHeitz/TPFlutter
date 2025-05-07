import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/task_data.dart';
import '../models/task.dart';
import '../utils/constants.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: AppColors.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Nouvelle tâche', style: AppTextStyles.headline),
          TextField(controller: _controller),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              final title = _controller.text.trim();
              if (title.isNotEmpty) {
                final newTask = Task(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: title,
                );
                Provider.of<TaskData>(context, listen: false).addTask(newTask);
                Navigator.pop(context);
              }
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return AppColors.accentColor;
                } else if (states.contains(WidgetState.hovered)) {
                  return AppColors.lightColor;
                }
                return AppColors.lightColor;
              }),
            ),
            child: const Text('Ajouter'),

          )
        ],
      ),
    );
  }
}
