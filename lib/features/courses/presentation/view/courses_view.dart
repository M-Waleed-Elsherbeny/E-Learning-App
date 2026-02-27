import 'package:flutter/material.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Courses View",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    );
  }
}
