import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
class DaLatScreen extends StatefulWidget {
  const DaLatScreen({super.key});

  @override
  State<DaLatScreen> createState() => _DaLatScreenState();
}
class _DaLatScreenState extends State<DaLatScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        TravelCard(
          name: "Chùa Linh Phước", 
          location: "Đà Lạt", 
          imagePath: "assets/imgs/chualinhphuoc.png"
        ),
        TravelCard(name: 'Vườn thú ZooDoo', location: 'Đà Lạt', imagePath: 'assets/imgs/vuonthuzoo.png'),
        TravelCard(name: 'Dalat Wonderland', location: 'Đà Lạt', imagePath: 'assets/imgs/Wonderland.png'),
        TravelCard(name: 'Đồi chè ', location: 'Đà Lạt', imagePath: 'assets/imgs/doiche.png')
      ],
    );
  }
  
}