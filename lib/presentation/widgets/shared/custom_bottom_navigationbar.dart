import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  // final int currentIndex;
  // final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    // this.currentIndex = 0,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // currentIndex: currentIndex,
      // onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.confirmation_num_outlined),
          label: 'Tickets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2_outlined),
          label: 'Inventario',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help_outline_rounded),
          label: 'Ayuda',
        ),
      ],
    );
  }
  
}