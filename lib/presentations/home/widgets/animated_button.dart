import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  final player = AudioPlayer();
  double _size = 100;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await player.play(AssetSource("click.wav"));
        setState(() {
          setState(() {
            _size = 100;
          });
        });
        widget.onTap();
      },
      onTapDown: (details) {
        setState(() {
          _size = 70;
        });
      },
      child: CircleAvatar(
        radius: _size,
        backgroundColor: Theme.of(context).primaryColor,
        child: widget.child,
      ),
    );
  }
}
