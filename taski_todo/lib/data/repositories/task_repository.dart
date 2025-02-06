import 'package:hive/hive.dart';
import 'package:taski_todo/data/models/task.dart';

class TaskRepository {
  static const String _boxName = "tasksBox";
  late Box<TaskModel> _taskBox;

  Future<void> init() async {
    _taskBox = await Hive.openBox<TaskModel>(_boxName);
  }

  Future<void> addTask(TaskModel task) async {
    await _taskBox.put(task.id, task);
  }

  List<TaskModel> getAllTasks() {
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
}
