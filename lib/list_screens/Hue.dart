import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
import 'package:flutter_ungdungdulich/widgets/SlowRoll.dart';
class HueScreen extends StatefulWidget {
  const HueScreen({super.key});

  @override
  State<HueScreen> createState() => _HueScreenState();
}
class _HueScreenState extends State<HueScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const SlowScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: [
        TravelCard(
          name: "Đại nội Huế", 
          location: "Huế", 
          imagePath: "assets/imgs/dainoihue.png"
        ),
        TravelCard(name: 'Chùa Thiên Mụ', location: 'Huế', imagePath: 'assets/imgs/chuathienmu.png'),
        TravelCard(name: 'Lăng Khải Định', location: 'Huế', imagePath: 'assets/imgs/langkhaidinh.png'),
        TravelCard(name: 'Thiền viện Trúc Lâm Bạch Mã', location: 'Huế', imagePath: 'assets/imgs/bachma.png')
      ],
    );
  }
  
}