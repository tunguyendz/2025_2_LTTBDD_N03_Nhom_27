import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/screens/noti.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
import 'package:flutter_ungdungdulich/translations/apptext.dart';

// ===== MÀN HÌNH TRANG CHỦ =====
// Hiển thị danh sách các địa điểm du lịch hot nhất
class HomeScreen extends StatefulWidget {
  final bool laTiengViet;        // Biến kiểm tra ngôn ngữ hiện tại
  final VoidCallback khiNhanNut; // Hàm callback khi nhấn nút đổi ngôn ngữ

  // Constructor - Bắt buộc phải truyền 2 tham số
  const HomeScreen({
    super.key,
    required this.laTiengViet,
    required this.khiNhanNut,
  });
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Lấy bộ từ vựng theo ngôn ngữ
    final ngonNgu = widget.laTiengViet ? AppTexts.vi : AppTexts.en;
    
    return Scaffold(
      backgroundColor: Colors.grey[200], // Màu nền xám nhạt
      
      // ===== THANH TIÊU ĐỀ =====
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ===== PHẦN TRÁI: AVATAR VÀ LỜI CHÀO =====
            Row(
              children: [
                // Avatar người dùng
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/imgs/hinhnen.png'),
                ),
                const SizedBox(width: 10),
                // Lời chào
                Text(
                  ngonNgu['hello']!,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            
            // ===== PHẦN PHẢI: NÚT NGÔN NGỮ VÀ THÔNG BÁO =====
            Row(
              children: [
                // ===== NÚT ĐỔI NGÔN NGỮ =====
                GestureDetector(
                  onTap: widget.khiNhanNut, // Gọi hàm đổi ngôn ngữ
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Hiển thị cờ theo ngôn ngữ
                        Text(widget.laTiengViet ? "🇻🇳" : "🇺🇸", style: const TextStyle(fontSize: 16)),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Khoảng cách giữa nút ngôn ngữ và chuông
                
                // ===== NÚT CHUÔNG THÔNG BÁO =====
                Stack(
                  children: [
                    // Icon chuông
                    IconButton(
                      onPressed: () {
                        // Chuyển đến màn hình thông báo
                        Navigator.push(context, MaterialPageRoute(builder: (_) => NotiScreen()));
                      },
                      icon: Icon(Icons.notifications_none, size: 28),
                    ),
                    // Badge số thông báo chưa đọc
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red, // Màu đỏ nổi bật
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2)
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: const Text(
                          '3', // Số lượng thông báo chưa đọc
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),

      // ===== NỘI DUNG CHÍNH =====
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // Tiêu đề danh sách địa điểm
          Text(
            ngonNgu['hot_places']!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          
          // ===== DANH SÁCH CÁC ĐỊA ĐIỂM DU LỊCH =====
          TravelCard(name: "Hạ Long Bay", location: "Quảng Ninh", imagePath: "assets/imgs/halongbay.png"),
          TravelCard(name: "Sầm Sơn", location: "Thanh Hóa", imagePath: "assets/imgs/samson.png"),
          TravelCard(name: "Cầu Vàng", location: "Đà Nẵng", imagePath: "assets/imgs/danang.png"),
          TravelCard(name: "Đại Nội Huế", location: "Huế", imagePath: "assets/imgs/dainoihue.png"),
          TravelCard(name: "Phú Quốc", location: "Kiên Giang", imagePath: "assets/imgs/phuquoc.png"),
          TravelCard(name: "Nha Trang", location: "Khánh Hòa", imagePath: "assets/imgs/nhatrang.png"),
          TravelCard(name: "Hội An", location: "Quảng Nam", imagePath: "assets/imgs/hoian.png"),
        ],
      ),
    );
  }
}