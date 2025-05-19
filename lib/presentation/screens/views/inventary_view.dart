import 'package:flutter/material.dart';

class InventaryView extends StatelessWidget {

  static const name = 'inventary-view';

  const InventaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InventaryView'),
      ),
      body: const _InventaryViewView(),
    );
  }
}

class _InventaryViewView extends StatelessWidget {
 const _InventaryViewView();

 @override
 Widget build(BuildContext context) {
  return const Center(
    child: Text('InventaryViewView'),
  );
 }
}