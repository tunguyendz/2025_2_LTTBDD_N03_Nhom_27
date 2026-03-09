import 'package:flutter/material.dart';
import'package:flutter_ungdungdulich/widgets/profile.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Profile', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green)),
      ),
      body:ListView(
        padding: const EdgeInsets.all(40),
        children: [
          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/imgs/hinhnen.png'),
            ),
          ),
          const SizedBox(height: 20),
          ProfileInformation(name: 'Họ và tên', value: 'Nguyễn Trung Tú'),
          ProfileInformation(name: 'Lớp', value: 'CNTT-6'),
          ProfileInformation(name: 'MSSV', value: '23010514'),
          ProfileInformation(name: 'Môn học', value: 'Lập trình thiết bị di động N03'),
          ProfileInformation(name: 'Đề tài', value: 'Xây dựng ứng dụng du lịch'),
          SizedBox(height: 20),
          Text('Thông tin liên hệ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
          ProfileInformation(name: 'Email', value: '23010514@st.phenikaa-uni.edu.vn'),

        ],
        
      )
      );
    
  }
}