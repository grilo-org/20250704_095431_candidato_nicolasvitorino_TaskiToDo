import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:taski_todo/data/models/task.dart';

class TaskRepository {
  static const String _boxName = "tasksBox";
  late Box<TaskModel> _taskBox;

  TaskRepository() {
    _taskBox = Hive.box<TaskModel>(_boxName);
  }
  Future<void> addTask(TaskModel task) async {
    await _taskBox.put(task.id, task);
    print("✅ Tarefa adicionada: ${task.toJson()}");
  }

  List<TaskModel> getAllTasks() {
    print("📋 Tarefas carregadas: ${_taskBox.values.toList()}");
    return _taskBox.values.toList();
  }

  Future<void> updateTask(TaskModel task) async {
    await _taskBox.put(task.id, task);
  }

  Future<void> deleteTask(int id) async {
    await _taskBox.delete(id);
  }

  List<TaskModel> getPendingTasks() {
    return _taskBox.values.where((task) => !task.isCompleted).toList();
  }

  List<TaskModel> getCompletedTasks() {
    return _taskBox.values.where((task) => task.isCompleted).toList();
  }

  Future<void> deleteAllDoneTasks() async {
    final doneTasks =
        _taskBox.values.where((task) => task.isCompleted).toList();
    for (var task in doneTasks) {
      await _taskBox.delete(task.id);
    }
  }
}
