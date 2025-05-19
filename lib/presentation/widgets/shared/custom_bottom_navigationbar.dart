import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  const CustomBottomNavigationBar({
    super.key,
  });

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;

    switch (location) {
      case '/':
        return 0;
      case '/tickets':
        return 1;
      case '/inventary':
        return 2;
      case '/help':
        return 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: getCurrentIndex(context),
      onTap: (value) {
        switch (value) {
          case 0:
            context.go('/');
            break;
          case 1:
            context.go('/tickets');
            break;
          case 2:
            context.go('/inventary');
            break;
          case 3:
            context.go('/help');
            break;
        }
      },
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