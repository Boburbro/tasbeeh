import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbeeh/cubits/task_cubit.dart';
import 'package:tasbeeh/presentations/home/widgets/animated_button.dart';
import 'package:tasbeeh/presentations/home/widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AdvancedDrawerController _controller = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
    context.read<TaskCubit>().loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _controller,
      drawer: HomeDrawer(),
      backdropColor: Colors.deepPurple,
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Scaffold(
        backgroundColor: Colors.deepPurple[300],
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _controller.showDrawer();
            },
            icon: Icon(
              Icons.menu_rounded,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "_dayCount/_dayPlan",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.restart_alt,
                color: Theme.of(context).iconTheme.color,
              ),
            )
          ],
        ),
        body: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return Center(
              child: AnimatedButton(
                onTap: () {
                  context.read<TaskCubit>().incrementCount();
                },
                child: Text(
                  state.count.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
