import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';


@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child:Text('Profile'),
      ),
    );
  }

}
