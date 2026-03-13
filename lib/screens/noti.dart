import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/SlowRoll.dart';

// ===== MÀN HÌNH THÔNG BÁO =====
// Hiển thị danh sách các thông báo của người dùng
class NotiScreen extends StatelessWidget {
  const NotiScreen({super.key});

  // Danh sách thông báo mẫu
  // tieuDe: Tiêu đề thông báo
  // moTa: Mô tả chi tiết
  // thoiGian: Thời gian nhận thông báo
  // bieuTuong: Icon hiển thị
  // daDoc: Trạng thái đã đọc hay chưa
  // loai: Loại thông báo (tour, khachSan, khuyenMai, danhGia, capNhat, hệThong)
  final List<Map<String, dynamic>> danhSachThongBao = const [
    {'tieuDe': 'Tour Đà Nẵng sắp khởi hành', 'moTa': 'Tour của bạn sẽ xuất phát lúc 7h sáng mai!', 'thoiGian': '5 phút trước', 'bieuTuong': Icons.flight_takeoff, 'daDoc': false, 'loai': 'tour'},
    {'tieuDe': 'Đặt phòng thành công', 'moTa': 'Phòng khách sạn Sầm Sơn đã được xác nhận.', 'thoiGian': '1 giờ trước', 'bieuTuong': Icons.hotel, 'daDoc': false, 'loai': 'khachSan'},
    {'tieuDe': 'Khuyến mãi đặc biệt', 'moTa': 'Giảm 30% tour Phú Quốc cuối tuần này!', 'thoiGian': '3 giờ trước', 'bieuTuong': Icons.local_offer, 'daDoc': true, 'loai': 'khuyenMai'},
    {'tieuDe': 'Đánh giá chuyến đi', 'moTa': 'Hãy đánh giá chuyến đi Hội An của bạn nhé!', 'thoiGian': 'Hôm qua', 'bieuTuong': Icons.star, 'daDoc': true, 'loai': 'danhGia'},
    {'tieuDe': 'Cập nhật lịch trình', 'moTa': 'Lịch trình tour Hà Nội đã được cập nhật.', 'thoiGian': 'Hôm qua', 'bieuTuong': Icons.update, 'daDoc': true, 'loai': 'capNhat'},
    {'tieuDe': 'Chào mừng!', 'moTa': 'Cảm ơn bạn đã sử dụng ứng dụng du lịch.', 'thoiGian': '20/05', 'bieuTuong': Icons.celebration, 'daDoc': true, 'loai': 'heThong'},
  ];

  // Hàm lấy màu theo loại thông báo
  // Mỗi loại thông báo có màu khác nhau để dễ phân biệt
  Color _layMauTheoLoai(String loai) {
    switch (loai) {
      case 'tour': return Colors.blue;           // Tour du lịch - màu xanh dương
      case 'khachSan': return Colors.orange;     // Khách sạn - màu cam
      case 'khuyenMai': return Colors.red;       // Khuyến mãi - màu đỏ
      case 'danhGia': return Colors.amber;       // Đánh giá - màu vàng
      case 'capNhat': return Colors.purple;      // Cập nhật - màu tím
      default: return Colors.teal;               // Hệ thống - màu xanh ngọc
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Màu nền xám nhạt
      
      // ===== THANH TIÊU ĐỀ =====
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Không có bóng đổ
        
        // Nút quay lại
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context), // Quay về màn hình trước
        ),
        
        // Tiêu đề căn giữa
        title: Text('Thông báo', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: true,
        
        // Nút đánh dấu đã đọc tất cả
        actions: [
          IconButton(
            icon: Icon(Icons.done_all, color: Colors.greenAccent),
            onPressed: () {}, // Xử lý đánh dấu đã đọc
          ),
        ],
      ),
      
      // ===== NỘI DUNG CHÍNH =====
      body: ListView.builder(
        physics: const SlowScrollPhysics(),
        padding: EdgeInsets.all(16), // Khoảng cách viền
        itemCount: danhSachThongBao.length, // Số lượng thông báo
        itemBuilder: (context, viTri) {
          final thongBao = danhSachThongBao[viTri]; // Lấy thông báo tại vị trí
          final mauLoai = _layMauTheoLoai(thongBao['loai']); // Lấy màu theo loại
          
          // ===== CARD THÔNG BÁO =====
          return Container(
            margin: EdgeInsets.only(bottom: 12), // Khoảng cách dưới
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16), // Bo góc
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05), // Bóng đổ nhẹ
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  // ===== THANH MÀU BÊN TRÁI =====
                  // Hiển thị màu theo loại và trạng thái đọc
                  Container(
                    width: 5,
                    decoration: BoxDecoration(
                      color: thongBao['daDoc'] ? Colors.grey[300] : mauLoai,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                  ),
                  
                  // ===== PHẦN NỘI DUNG =====
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ===== KHUNG ICON =====
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: (thongBao['daDoc'] ? Colors.grey[300] : mauLoai)!.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              thongBao['bieuTuong'],
                              color: thongBao['daDoc'] ? Colors.grey : mauLoai,
                              size: 22,
                            ),
                          ),
                          SizedBox(width: 12),
                          
                          // ===== NỘI DUNG VĂN BẢN =====
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Tiêu đề và chấm chưa đọc
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        thongBao['tieuDe'],
                                        style: TextStyle(
                                          fontWeight: thongBao['daDoc'] ? FontWeight.w500 : FontWeight.bold,
                                          fontSize: 15,
                                          color: thongBao['daDoc'] ? Colors.grey[700] : Colors.black,
                                        ),
                                      ),
                                    ),
                                    // Chấm tròn nếu chưa đọc
                                    if (!thongBao['daDoc'])
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: mauLoai,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                
                                // Mô tả
                                Text(
                                  thongBao['moTa'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis, // Cắt bớt nếu quá dài
                                ),
                                SizedBox(height: 6),
                                
                                // Thời gian
                                Text(
                                  thongBao['thoiGian'],
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
