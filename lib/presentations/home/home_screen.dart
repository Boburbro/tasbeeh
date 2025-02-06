import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:tasbeeh/presentations/home/widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _count = 0;

  final player = AudioPlayer();

  double _size = 100;

  int _dayPlan = 1000;
  int _dayCount = 0;

  final AdvancedDrawerController _controller = AdvancedDrawerController();

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
            "$_dayCount/$_dayPlan",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _count = 0;
                });
              },
              icon: Icon(
                Icons.restart_alt,
                color: Theme.of(context).iconTheme.color,
              ),
            )
          ],
        ),
        body: Center(
          child: GestureDetector(
            onTap: () async {
              await player.play(AssetSource("click.wav"));
              setState(() {
                _count++;
                _dayCount++;
              });
              setState(() {
                _size = 100;
              });
            },
            onTapDown: (details) {
              setState(() {
                _size = 70;
              });
            },
            child: CircleAvatar(
              radius: _size,
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                _count.toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
