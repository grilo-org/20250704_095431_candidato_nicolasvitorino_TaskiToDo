import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski_todo/logic/blocs/task_bloc/task_bloc.dart';
import 'package:taski_todo/presentation/widgets/task_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int tasksQuantity = 0;

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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  tasksQuantity =
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
                  return const CircularProgressIndicator();
                } else {
                  return const Text(
                    'Create tasks to achieve more.',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8D9CB8),
                    ),
                  );
                }
              },
            ),
            tasksQuantity <= 0
                ? SizedBox(
                    child: Image.asset('assets/desk.jpg'),
                  )
                : const TaskWidget(
                    isDone: false,
                    // onToggleCompleted: ,
                    id: 0,
                    title: 'Design sign up flow',
                    description:
                        'By the time a prospect arrives at your signup page, in most cases, they\'ve already By the time a prospect arrives at your signup page, in most cases.',
                  ),
          ],
        ),
      ),
    );
  }
}
