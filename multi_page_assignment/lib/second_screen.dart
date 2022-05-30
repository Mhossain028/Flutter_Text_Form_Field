import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondScreen extends StatefulWidget {
  String value;
  SecondScreen(
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<SecondScreen> createState() => _SecondScreenState(value);
}

class _SecondScreenState extends State<SecondScreen> {
  String value;
  _SecondScreenState(this.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            value,
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
