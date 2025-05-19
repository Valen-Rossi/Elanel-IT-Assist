import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {

  static const name = 'help-view';

  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HelpView'),
      ),
      body: const _HelpViewView(),
    );
  }
}

class _HelpViewView extends StatelessWidget {
 const _HelpViewView();

 @override
 Widget build(BuildContext context) {
  return const Center(
    child: Text('HelpViewView'),
  );
 }
}