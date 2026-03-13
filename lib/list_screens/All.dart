import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
import 'package:flutter_ungdungdulich/widgets/SlowRoll.dart';
class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}
class _AllScreenState extends State<AllScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const SlowScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: [
          TravelCard(name: "Hạ Long Bay", location: "Quảng Ninh", imagePath: "assets/imgs/halongbay.png"),
          TravelCard(name: "Sầm Sơn", location: "Thanh Hóa", imagePath: "assets/imgs/samson.png"),
          TravelCard(name: "Cầu Vàng", location: "Đà Nẵng", imagePath: "assets/imgs/danang.png"),
          TravelCard(name: "Đại Nội Huế", location: "Huế", imagePath: "assets/imgs/dainoihue.png"),
          TravelCard(name: "Phú Quốc", location: "Kiên Giang", imagePath: "assets/imgs/phuquoc.png"),
          TravelCard(name: "Nha Trang", location: "Khánh Hòa", imagePath: "assets/imgs/nhatrang.png"),
          TravelCard(name: "Hội An", location: "Quảng Nam", imagePath: "assets/imgs/hoian.png"),
      ],
    );
  }
  
}