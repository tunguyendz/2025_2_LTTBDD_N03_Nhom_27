import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/list_screens/All.dart';
import 'package:flutter_ungdungdulich/list_screens/DaLat.dart';
import 'package:flutter_ungdungdulich/list_screens/DaNang.dart';
import 'package:flutter_ungdungdulich/list_screens/HaNoi.dart';
import 'package:flutter_ungdungdulich/list_screens/HoChiMinh.dart';
import 'package:flutter_ungdungdulich/list_screens/Hue.dart';
import 'package:flutter_ungdungdulich/list_screens/NhaTrang.dart';
import 'package:flutter_ungdungdulich/list_screens/PhuQuoc.dart';
import 'package:flutter_ungdungdulich/translations/apptext.dart';

// ===== MÀN HÌNH KHÁM PHÁ =====
// Cho phép người dùng khám phá các địa điểm du lịch theo từng thành phố
class DiscoverScreen extends StatefulWidget {
  final bool laTiengViet; // Biến kiểm tra ngôn ngữ hiện tại
  
  const DiscoverScreen({super.key, required this.laTiengViet});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int viTriDangChon = 0; // Vị trí danh mục đang được chọn (mặc định = 0 tức "Tất cả")
  
  // Danh sách các danh mục địa điểm
  final List<String> danhSachDanhMuc = ['All', 'Hà Nội', 'Đà Nẵng', 'Hồ Chí Minh', 'Huế', 'Đà lạt', 'Nha Trang', 'Phú Quốc'];
  
  // Danh sách các màn hình tương ứng với từng danh mục
  final List<Widget> danhSachNoiDung = [
    const AllScreen(),        // Tất cả địa điểm
    const HaNoiScreen(),      // Địa điểm Hà Nội
    const DaNangScreen(),     // Địa điểm Đà Nẵng
    const HoChiMinhScreen(),  // Địa điểm Hồ Chí Minh
    const HueScreen(),        // Địa điểm Huế
    const DaLatScreen(),      // Địa điểm Đà Lạt
    const NhaTrangScreen(),   // Địa điểm Nha Trang
    const PhuQuocScreen()     // Địa điểm Phú Quốc
  ];
  
  @override
  Widget build(BuildContext context) {
    // Lấy bộ từ vựng theo ngôn ngữ
    final ngonNgu = widget.laTiengViet ? AppTexts.vi : AppTexts.en;
    
    return Scaffold(
      // ===== THANH TIÊU ĐỀ =====
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tiêu đề chính
            Text(ngonNgu['discover_title']!, style: TextStyle(color: Colors.greenAccent, fontSize: 25)),
            SizedBox(height: 8),
            // Tiêu đề phụ
            Text(ngonNgu['discover_subtitle']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[600])),
          ],
        )
      ),
      
      // ===== NỘI DUNG CHÍNH =====
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            // ===== THANH TÌM KIẾM VÀ BỘ LỌC =====
            Row(
              children: [
                // Ô tìm kiếm
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: ngonNgu['search_hint']!, // Gợi ý tìm kiếm
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      suffixIcon: const Icon(Icons.search, color: Colors.greenAccent), // Icon kính lúp
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                
                // Nút bộ lọc với badge số lượng
                Stack(
                  clipBehavior: Clip.none, // Cho phép badge trồi ra ngoài
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: IconButton(
                        onPressed: () {}, // Xử lý mở bộ lọc
                        icon: const Icon(Icons.tune, size: 20, color: Colors.greenAccent),
                      )
                    ),
                    // Badge hiển thị số bộ lọc đang áp dụng
                    Positioned(
                      right: -5,
                      top: -5,
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          shape: BoxShape.circle,
                        ),
                        child: const Text('3', style: TextStyle(fontSize: 10, color: Colors.white)),
                      ),
                    ),
                  ],
                )
              ],
            ),
            
            const SizedBox(height: 20),
            
            // ===== DANH SÁCH DANH MỤC NGANG =====
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Cuộn ngang
                itemCount: danhSachDanhMuc.length,
                itemBuilder: (context, viTri) {
                  bool dangDuocChon = (viTri == viTriDangChon); // Kiểm tra có đang được chọn không

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        viTriDangChon = viTri; // Cập nhật vị trí đang chọn
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 23),
                      child: Text(
                        danhSachDanhMuc[viTri], // Hiển thị tên danh mục
                        style: TextStyle(
                          fontSize: 16,
                          // Đổi màu và độ đậm dựa vào trạng thái chọn
                          color: dangDuocChon ? Colors.greenAccent : Colors.grey,
                          fontWeight: dangDuocChon ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 20),
            
            // ===== HIỂN THỊ NỘI DUNG THEO DANH MỤC =====
            Expanded(child: danhSachNoiDung[viTriDangChon])
          ],
        ),
      ),
    );
  }
}