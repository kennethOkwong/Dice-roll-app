import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  final randommizer = Random();
  String imageUrl = 'assets/images/dice-1.png';
  void rollDice() {
    var diceVValue = randommizer.nextInt(6) + 1;
    setState(() {
      imageUrl = 'assets/images/dice-$diceVValue.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 79, 8, 130),
            Color.fromARGB(255, 61, 4, 69),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: 150,
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              rollDice();
            },
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 20, color: Colors.white)),
            ),
            child: const Text(
              'Roll dice',
            ),
          )
        ],
      ),
    );
  }
}
