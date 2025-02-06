import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski_todo/data/repositories/task_repository.dart';
import 'package:taski_todo/logic/blocs/task_bloc/task_bloc.dart';
import 'package:taski_todo/presentation/pages/home_page.dart';

void main() {
  final taskRepository = TaskRepository(); // Instância do repositório

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              TaskBloc(taskRepository: taskRepository)..add(GetAllTasks()),
        ),
      ],
      child: const TaskiToDoApp(),
    ),
  );
}

class TaskiToDoApp extends StatelessWidget {
  const TaskiToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskiToDo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
