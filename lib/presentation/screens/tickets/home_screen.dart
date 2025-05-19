import 'package:flutter/material.dart';

import 'package:elanel_asistencia_it/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  final Widget childView;

  const HomeScreen({
    super.key, 
    required this.childView
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: const CustomBottomNavigationBar(
        // currentIndex: 0,
      ),
    );
  }
}
