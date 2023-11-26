import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Neuroxphone',
      home: Xylophone(),
    );
  }
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {

  void keyCallback(int i) {
    final player = AudioPlayer();
    player.play(AssetSource("note$i.wav"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          XyloKey(
            color: Colors.red,
            fn: () => keyCallback(1),
          ),
          XyloKey(
            color: Colors.orange,
            fn: () => keyCallback(2),
          ),
          XyloKey(
            color: Colors.yellow,
            fn: () => keyCallback(3),
          ),
          XyloKey(
            color: Colors.green,
            fn: () => keyCallback(4),
          ),
          XyloKey(
            color: Colors.teal,
            fn: () => keyCallback(5),
          ),
          XyloKey(
            color: Colors.blue,
            fn: () => keyCallback(6),
          ),
          XyloKey(
            color: Colors.indigo,
            fn: () => keyCallback(7),
          ),
        ],
      ),
    );
  }
}

class XyloKey extends StatelessWidget {
  const XyloKey({super.key, this.fn, required this.color});
  final VoidCallback? fn;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero)
        ),
        onPressed: fn, 
        child: Container(),
      ),
    );
  }
}
