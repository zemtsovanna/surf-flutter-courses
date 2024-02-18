import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'KodeMono',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Image.asset(
              'asset/photo.jpg',
              height: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'asset/icon.svg',
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Flexible(
                  child: Text(
                    'Земцова Анна Павловна',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'roboto',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Bio:',
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Живу в Питере. 26 лет, по образованию инженер-материаловед.',
              softWrap: true,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'roboto',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Hobbies:',
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Воспитываю хомяка, занимаюсь танцами.',
              softWrap: true,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'roboto',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Experience in software  development:',
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Опыта в разработке не имею :(',
              softWrap: true,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'roboto',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
