import 'package:flutter/material.dart';
import'package:flutter_ungdungdulich/widgets/profile.dart';
import 'package:flutter_ungdungdulich/translations/apptext.dart';

// ===== MÀN HÌNH TÀI KHOẢN =====
// Hiển thị thông tin cá nhân của người dùng
class ProfileScreen extends StatelessWidget {
  final bool laTiengViet; // Biến kiểm tra ngôn ngữ hiện tại
  
  const ProfileScreen({super.key, required this.laTiengViet});

  @override
  Widget build(BuildContext context) {
    // Lấy bộ từ vựng theo ngôn ngữ
    final ngonNgu = laTiengViet ? AppTexts.vi : AppTexts.en;
    
    return Scaffold(
      backgroundColor: Colors.white, // Màu nền trắng
      
      // ===== THANH TIÊU ĐỀ =====
      appBar: AppBar(
        centerTitle: true, // Căn giữa tiêu đề
        backgroundColor: Colors.white,
        elevation: 0, // Không có bóng đổ
        title: Text(ngonNgu['profile_title']!, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green)),
      ),
      
      // ===== NỘI DUNG CHÍNH =====
      body: ListView(
        padding: const EdgeInsets.all(40),
        children: [
          // ===== ẢNH ĐẠI DIỆN =====
          Center(
            child: CircleAvatar(
              radius: 100, // Bán kính avatar
              backgroundImage: AssetImage('assets/imgs/hinhnen.png'),
            ),
          ),
          const SizedBox(height: 20),
          
          // ===== THÔNG TIN CÁ NHÂN =====
          ProfileInformation(name: ngonNgu['full_name']!, value: 'Nguyễn Trung Tú'),     // Họ và tên
          ProfileInformation(name: ngonNgu['class']!, value: 'CNTT-6'),                   // Lớp
          ProfileInformation(name: ngonNgu['student_id']!, value: '23010514'),            // Mã số sinh viên
          ProfileInformation(name: ngonNgu['subject']!, value: ngonNgu['subject_value']!), // Môn học
          ProfileInformation(name: ngonNgu['topic']!, value: ngonNgu['topic_value']!),     // Đề tài
          
          SizedBox(height: 20),
          
          // ===== THÔNG TIN LIÊN HỆ =====
          Text(ngonNgu['contact_info']!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
          ProfileInformation(name: ngonNgu['email']!, value: '23010514@st.phenikaa-uni.edu.vn'), // Email
        ],
      )
    );
  }
}