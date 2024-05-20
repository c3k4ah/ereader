import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChapterPage extends StatelessWidget {
  const ChapterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Chapter Page'),
      ),
    );
  }
}
