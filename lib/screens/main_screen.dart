import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/app_icons.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    const Center(child: Text('Khám phá')),
    const Center(child: Text('Đặt phòng')),
    const Center(child: Text('Profile')),];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(AppIcons.houseChimney), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(AppIcons.discover), label: 'Khám phá'),
          BottomNavigationBarItem(icon: Icon(AppIcons.reservationTable), label: 'Đặt phòng'),
          BottomNavigationBarItem(icon: Icon(AppIcons.userPen), label: 'Profile'),
        ],
      ),
    );
  }
}