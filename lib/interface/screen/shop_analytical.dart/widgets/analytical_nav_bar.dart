import 'package:flutter/material.dart';

class AnalyticalNavBar extends StatefulWidget {
  @override
  _AnalyticalNavBarState createState() => _AnalyticalNavBarState();
}

class _AnalyticalNavBarState extends State<AnalyticalNavBar> {
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: fullNavItem.map((item) => item).toList(),
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFFE36789),
    );
  }

  List<BottomNavigationBarItem> get fullNavItem => [
        BottomNavigationBarItem(
          icon: Icon(Icons.table_chart),
          title: Text('Order Entry'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          title: Text('Sale Curves'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart),
          title: Text('Product Chart'),
        ),
      ];
}
