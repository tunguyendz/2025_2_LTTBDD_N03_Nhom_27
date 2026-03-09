import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
import 'package:flutter_ungdungdulich/translations/apptext.dart';
class HomeScreen extends StatefulWidget {
  final bool isVietnamese;
  final VoidCallback onTap;

  // 2. Bắt buộc phải có trong hàm khởi tạo (Constructor)
  const HomeScreen({
    super.key,
    required this.isVietnamese,
    required this.onTap,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final lang = widget.isVietnamese ? AppTexts.vi : AppTexts.en;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/imgs/hinhnen.png'),
            ),
            const SizedBox(width: 10),
            Text(lang['hello']!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            
            
          ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap:widget.onTap,
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
                  child:Row(
                    children: [
                      Text(widget.isVietnamese ? "🇻🇳" : "🇺🇸", style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 5),
                      
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16), // Khoảng cách giữa nút ngôn ngữ và chuông
          
          // NÚT CHUÔNG THÔNG BÁO
          Stack(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none,size: 28,)),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
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

          ]

        
          
      ),
      ),

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(lang['hot_places']!, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.green),),
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