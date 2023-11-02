import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/selected_page_provider.dart';

class CustomBottomBarWidget extends StatefulWidget {
  const CustomBottomBarWidget({super.key});

  @override
  State<CustomBottomBarWidget> createState() => _CustomBottomBarWidgetState();
}

class _CustomBottomBarWidgetState extends State<CustomBottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    var selectedPageProvider = Provider.of<SelectedPageProvider>(context,listen: true);
    int selectedPage = Provider.of<SelectedPageProvider>(context).selectedPage;

    void onItemTapped(int index) {
      selectedPageProvider.changePage(index);
    }

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work_history),
          label: 'Shifts',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_checkout),
          label: 'Expenses',
          backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Colors.pink,
        ),
      ],
      currentIndex: selectedPage,
      selectedItemColor: Colors.amber[800],
      onTap: onItemTapped,
    );
  }
}
