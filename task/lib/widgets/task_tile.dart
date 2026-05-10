import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../providers/task_provider.dart';
import '../screens/task_detail_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskDetailScreen(task: task)),
        );
      },
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Text(
          task.title.isNotEmpty ? task.title[0].toUpperCase() : '?',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(DateFormat('MMMM dd, yyyy').format(task.deadline)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 4, height: 40, color: const Color(0xFFE8674A)),
          Checkbox(
            value: task.isCompleted,
            activeColor: const Color(0xFFE8674A),
            onChanged: (_) => context.read<TaskProvider>().toggleTask(task.id),
          ),
        ],
      ),
    );
  }
}
