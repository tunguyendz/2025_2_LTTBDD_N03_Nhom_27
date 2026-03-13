import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
import 'package:flutter_ungdungdulich/widgets/SlowRoll.dart';
class HoChiMinhScreen extends StatefulWidget {
  const HoChiMinhScreen({super.key});

  @override
  State<HoChiMinhScreen> createState() => _HoChiMinhScreenState();
}
class _HoChiMinhScreenState extends State<HoChiMinhScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const SlowScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: [
        TravelCard(
          name: "Địa đạo củ chi ", 
          location: "Hồ CHí Minh", 
          imagePath: "assets/imgs/cuchi.png"
        ),
        TravelCard(name: 'Nhà thờ Đức Bà', location: 'Hồ Chí Minh', imagePath: 'assets/imgs/nhathoducba.png'),
        TravelCard(name: 'Dinh Thống Nhất', location: 'Hồ Chí Minh', imagePath: 'assets/imgs/dinhdoclap.png'),
        TravelCard(name: 'Chợ Bến Thành', location: 'Hồ Chí Minh', imagePath: 'assets/imgs/chobenthanh.png')
      ],
    );
  }
  
}