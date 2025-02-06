import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski_todo/logic/blocs/task_bloc/task_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(GetAllTasks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/logo.jpg'),
        actions: [
          Image.asset('assets/user.jpg'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/todo_bottom_bar.jpg'), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/create_bottom_bar.jpg'), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/search_bottom_bar.jpg'), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/done_bottom_bar.jpg'), label: ''),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome, ',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3F3D56),
                    ),
                  ),
                  TextSpan(
                    text: 'John',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF007FFF),
                    ),
                  ),
                  TextSpan(
                    text: '.',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3F3D56),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is TaskLoaded) {
                  int tasksQuantity =
                      state.tasks.length; // Obtém o número de tarefas
                  return Text(
                    'You\'ve got $tasksQuantity to do',
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8D9CB8),
                    ),
                  );
                } else if (state is TaskLoading) {
                  return const CircularProgressIndicator(); // Mostra um loader enquanto carrega
                } else {
                  return const Text(
                    'No tasks found.',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8D9CB8),
                    ),
                  ); // Caso não tenha tarefas
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
