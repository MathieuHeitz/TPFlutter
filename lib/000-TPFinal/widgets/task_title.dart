import 'package:flutter/material.dart';
import '../models/task.dart';
import '../utils/constants.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function(bool?) onChanged;
  final VoidCallback onDelete;

  const TaskTile({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: AppDecorations.taskTileDecoration.copyWith(
          color: task.isDone ? AppColors.taskDoneColor : AppColors.taskTileColor,
        ),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Text(
        task.title,
        style: AppTextStyles.headline.copyWith(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: task.isDone,
        onChanged: onChanged,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.blueGrey),
        onPressed: onDelete,
      ),
    )
    );
  }
}
