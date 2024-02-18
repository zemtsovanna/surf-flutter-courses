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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            child: RotationTransition(
              turns: _animation,
              child: AnimatedContainer(
                width: 50,
                height: 50,
                duration: _duration,
                color: _color,
              ),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onHorizontalDragUpdate: _onHorizontalDrag,
              onVerticalDragUpdate: _onVerticalDrag,
              onTap: _onTap,
              onLongPress: _onLongPress,
            ),
          ),
        ],
      ),
    );
  }

  void _onLongPress() {}

  void _onTap() {
    setState(() {
      final randomColorIndex = Random().nextInt(_colors.length);
      _color = _colors[randomColorIndex];
    });
  }

  void _onVerticalDrag(details) {
    setState(() {
      yPosition = yPosition + details.delta.dy;
    });
  }

  void _onHorizontalDrag(details) {
    setState(() {
      xPosition = xPosition + details.delta.dx;
    });
  }
}
