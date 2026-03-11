import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/translations/apptext.dart';

// ===== MÀN HÌNH TIN NHẮN =====
// Hiển thị danh sách các cuộc trò chuyện với hướng dẫn viên, khách sạn, tour...
class MassageScreen extends StatefulWidget {
  final bool laTiengViet; // Biến kiểm tra ngôn ngữ hiện tại
  
  const MassageScreen({super.key, required this.laTiengViet});

  @override
  State<MassageScreen> createState() => _MassageScreenState();
}

class _MassageScreenState extends State<MassageScreen> {
  // Danh sách các cuộc trò chuyện mẫu
  // ten: Tên người/đơn vị gửi tin
  // tinNhan: Nội dung tin nhắn cuối
  // thoiGian: Thời gian gửi tin
  // chuaDoc: Số tin nhắn chưa đọc
  // dangOnline: Trạng thái online
  final List<Map<String, dynamic>> danhSachTroChuyen = [
    {'ten': 'Hướng dẫn viên Minh', 'tinNhan': 'Tour Đà Nẵng ngày mai xuất phát lúc 7h!', 'thoiGian': '09:30', 'chuaDoc': 2, 'dangOnline': true},
    {'ten': 'Khách sạn Sầm Sơn', 'tinNhan': 'Phòng của bạn đã được xác nhận.', 'thoiGian': '08:15', 'chuaDoc': 1, 'dangOnline': false},
    {'ten': 'Hội An Travel', 'tinNhan': 'Bạn có muốn thêm tour tham quan phố cổ không?', 'thoiGian': 'Hôm qua', 'chuaDoc': 0, 'dangOnline': true},
    {'ten': 'Hướng dẫn viên Lan', 'tinNhan': 'Cảm ơn bạn đã đặt tour Phú Quốc!', 'thoiGian': 'Hôm qua', 'chuaDoc': 0, 'dangOnline': false},
    {'ten': 'Resort Nha Trang', 'tinNhan': 'Chúc bạn có kỳ nghỉ vui vẻ tại Nha Trang!', 'thoiGian': 'T2', 'chuaDoc': 0, 'dangOnline': false},
    {'ten': 'Tour Hà Nội Cổ', 'tinNhan': 'Lịch trình tham quan 36 phố phường đã gửi.', 'thoiGian': 'T2', 'chuaDoc': 0, 'dangOnline': true},
    {'ten': 'Huế Heritage Tour', 'tinNhan': 'Đại Nội Huế mở cửa từ 7h - 17h30 bạn nhé.', 'thoiGian': '18/05', 'chuaDoc': 0, 'dangOnline': false},
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
            Text(ngonNgu['message_title']!, style: TextStyle(color: Colors.greenAccent, fontSize: 25)),
            // Tiêu đề phụ
            Text(ngonNgu['message_subtitle']!, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          ],
        ),
      ),
      
      // ===== DANH SÁCH TIN NHẮN =====
      body: ListView.separated(
        itemCount: danhSachTroChuyen.length, // Số lượng cuộc trò chuyện
        separatorBuilder: (_, __) => Divider(height: 1, indent: 80), // Đường kẻ phân cách
        itemBuilder: (context, viTri) {
          final troChuyen = danhSachTroChuyen[viTri]; // Lấy cuộc trò chuyện tại vị trí
          
          return ListTile(
            // ===== AVATAR VÀ TRẠNG THÁI ONLINE =====
            leading: Stack(
              children: [
                // Avatar hiển thị chữ cái đầu của tên
                CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  child: Text(troChuyen['ten'][0], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                // Chấm xanh nếu đang online
                if (troChuyen['dangOnline'])
                  Positioned(
                    right: 0, bottom: 0,
                    child: Container(
                      width: 12, height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green, // Màu xanh = đang online
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            
            // ===== TÊN NGƯỜI GỬI =====
            // In đậm nếu có tin chưa đọc
            title: Text(troChuyen['ten'], style: TextStyle(fontWeight: troChuyen['chuaDoc'] > 0 ? FontWeight.bold : FontWeight.normal)),
            
            // ===== NỘI DUNG TIN NHẮN =====
            // Hiển thị 1 dòng, cắt bớt nếu quá dài
            subtitle: Text(troChuyen['tinNhan'], maxLines: 1, overflow: TextOverflow.ellipsis),
            
            // ===== THỜI GIAN VÀ SỐ TIN CHƯA ĐỌC =====
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Thời gian
                Text(troChuyen['thoiGian'], style: TextStyle(fontSize: 12, color: Colors.grey)),
                // Badge số tin chưa đọc
                if (troChuyen['chuaDoc'] > 0)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(color: Colors.greenAccent, borderRadius: BorderRadius.circular(12)),
                    child: Text('${troChuyen['chuaDoc']}', style: TextStyle(fontSize: 11, color: Colors.white)),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
