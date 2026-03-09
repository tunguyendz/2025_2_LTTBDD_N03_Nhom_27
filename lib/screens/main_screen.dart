import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/app_icons.dart';
import 'package:flutter_ungdungdulich/screens/profile.dart';
import 'home_screen.dart';
import 'package:flutter_ungdungdulich/translations/apptext.dart';
import 'discover.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool isVietnamese = true; // Biến để theo dõi ngôn ngữ hiện tại

  void onTap() {
    setState(() {
      isVietnamese = !isVietnamese; // Đổi ngôn ngữ
    });
  }
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
    HomeScreen(
      isVietnamese: isVietnamese, 
      onTap: onTap,
    ),
    const DiscoverScreen(),
    const Center(child: Text('Đặt phòng')),
    ProfileScreen(),];
    final lang = isVietnamese ? AppTexts.vi : AppTexts.en;
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: const Icon(AppIcons.houseChimney), label: lang['home']!),
          BottomNavigationBarItem(icon: const Icon(AppIcons.discover), label: lang['discover']!),
          BottomNavigationBarItem(icon: const Icon(AppIcons.reservationTable), label: lang['booking']!),
          BottomNavigationBarItem(icon: const Icon(AppIcons.userPen), label: lang['profile']!),
        ],
      ),
    );
  }
}