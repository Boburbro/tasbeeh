import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbeeh/cubits/task_cubit.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.tasks[index].title),
                onTap: () {
                  // context.read<TaskCubit>().appRepository.createData(Task(
                  //       planDay: 10,
                  //       title: "Test",
                  //       startTime: DateTime.now(),
                  //       endTime: DateTime.now().add(Duration(days: 10)),
                  //     ));
                  // context.read<TaskCubit>().loadTasks();
                },
              );
            },
          );
        },
      ),
    );
  }
}
