import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasbeeh/presentations/tasks/tasks_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              automaticallyImplyLeading: false,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple[200],
              child: Icon(Icons.person_rounded),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.deepPurpleAccent,
              child: ListTile(
                leading: Icon(
                  Icons.analytics_outlined,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(
                  "Analysis",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.deepPurpleAccent,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (_) => TasksScreen()));
                },
                leading: Icon(
                  Icons.task_alt_rounded,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(
                  "Tasks",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
