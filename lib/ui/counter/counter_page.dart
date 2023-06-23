import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  static const String routeName = '/CounterPage';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: const Center(
        child: Text('This is Counter App'),
      ),
    );
  }
}
