import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
class DaNangScreen extends StatefulWidget {
  const DaNangScreen({super.key});

  @override
  State<DaNangScreen> createState() => _DaNangScreenState();
}
class _DaNangScreenState extends State<DaNangScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        TravelCard(
          name: "Bà Nà Hills", 
          location: "Đà Nẵng", 
          imagePath: "assets/imgs/banahill.png"
        ),
        TravelCard(name: 'Bán đảo Sơn Trà', location: 'Đà Nẵng', imagePath: 'assets/imgs/bandaosontra.png'),
        TravelCard(name: 'Bãi biển Mỹ Khê', location: 'Đà Nẵng', imagePath: 'assets/imgs/baibienmykhe.png'),
        TravelCard(name: 'Cù lao Chàm', location: 'Đà Nẵng', imagePath: 'assets/imgs/culaocham.png')
      ],
    );
  }
  
}