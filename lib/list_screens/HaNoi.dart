import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
import 'package:flutter_ungdungdulich/widgets/SlowRoll.dart';
class HaNoiScreen extends StatefulWidget {
  const HaNoiScreen({super.key});

  @override
  State<HaNoiScreen> createState() => _HaNoiScreenState();
}
class _HaNoiScreenState extends State<HaNoiScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const SlowScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: [
        TravelCard(
          name: "Phố cổ", 
          location: "Hà Nội", 
          imagePath: "assets/imgs/phoco.png"
        ),
        TravelCard(name: 'Lăng Bác', location: 'Hà Nội', imagePath: 'assets/imgs/langbac.png'),
        TravelCard(name: 'Hồ Gươm', location: 'Hà Nội', imagePath: 'assets/imgs/hoguom.png'),
        TravelCard(name: 'Văn Miếu', location: 'Hà Nội', imagePath: 'assets/imgs/vanmieu.png')
      ],
    );
  }
  
}