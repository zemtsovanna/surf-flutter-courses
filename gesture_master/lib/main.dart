import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GestureMaster',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.limeAccent),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _colors = [
    Colors.amber,
    Colors.black,
    Colors.blue,
    Colors.brown,
    Colors.cyan,
    Colors.red,
    Colors.green,
  ];

  static const _duration = Duration(
    milliseconds: 300,
  );
  double xPosition = 0;

  double yPosition = 0;

  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: xPosition,
            top: yPosition,
            child: AnimatedContainer(
              width: 50,
              height: 50,
              duration: _duration,
              color: _color,
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              // TODO(zemtsova): сделай onVerticalDragUpdate по примеру _onVerticalDrag.
              onVerticalDragUpdate: _onVerticalDrag,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }

  void onTap() {
    setState(() {
      print('onTap');
      final randomColorIndex = Random().nextInt(_colors.length);
      _color = _colors[randomColorIndex];
    });
  }

  void _onVerticalDrag(details) {
    setState(() {
      print('onVerticalDrag: ${details.delta.dy}');
      yPosition = yPosition + details.delta.dy;
    });
  }
}
