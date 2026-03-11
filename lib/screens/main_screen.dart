import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/app_icons.dart';
import 'package:flutter_ungdungdulich/screens/profile.dart';
import 'home_screen.dart';
import 'package:flutter_ungdungdulich/translations/apptext.dart';
import 'discover.dart';
import 'message.dart';

// ===== MÀN HÌNH CHÍNH =====
// Màn hình container chứa bottom navigation và các màn hình con
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int viTriDangChon = 0;      // Vị trí tab đang được chọn (0: Trang chủ, 1: Khám phá, 2: Tin nhắn, 3: Tài khoản)
  bool laTiengViet = true;    // Biến theo dõi ngôn ngữ hiện tại (true: Tiếng Việt, false: Tiếng Anh)

  // Hàm xử lý khi nhấn nút đổi ngôn ngữ
  void doiNgonNgu() {
    setState(() {
      laTiengViet = !laTiengViet; // Đảo ngược trạng thái ngôn ngữ
    });
  }
  
  // Hàm xử lý khi nhấn vào item trong bottom navigation
  void khiChonTab(int viTri) {
    setState(() {
      viTriDangChon = viTri; // Cập nhật vị trí đang chọn
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // Danh sách các màn hình con
    final List<Widget> danhSachManHinh = [
      HomeScreen(
        laTiengViet: laTiengViet, 
        khiNhanNut: doiNgonNgu,
      ),
      DiscoverScreen(laTiengViet: laTiengViet),
      MassageScreen(laTiengViet: laTiengViet),
      ProfileScreen(laTiengViet: laTiengViet),
    ];
    
    // Lấy bộ từ vựng theo ngôn ngữ
    final ngonNgu = laTiengViet ? AppTexts.vi : AppTexts.en;
    
    return Scaffold(
      // Hiển thị màn hình con theo vị trí đang chọn
      body: danhSachManHinh[viTriDangChon],
      
      // ===== THANH ĐIỀU HƯỚNG DƯỚI =====
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viTriDangChon,        // Vị trí đang chọn
        backgroundColor: Colors.white,       // Màu nền trắng
        selectedItemColor: Colors.green,     // Màu khi được chọn
        unselectedItemColor: Colors.grey,    // Màu khi không được chọn
        onTap: khiChonTab,                   // Hàm xử lý khi nhấn
        items: [
          // Tab Trang chủ
          BottomNavigationBarItem(icon: const Icon(AppIcons.houseChimney), label: ngonNgu['home']!),
          // Tab Khám phá
          BottomNavigationBarItem(icon: const Icon(AppIcons.discover), label: ngonNgu['discover']!),
          // Tab Tin nhắn
          BottomNavigationBarItem(icon: const Icon(AppIcons.reservationTable), label: ngonNgu['mess']!),
          // Tab Tài khoản
          BottomNavigationBarItem(icon: const Icon(AppIcons.userPen), label: ngonNgu['profile']!),
        ],
      ),
    );
  }
}