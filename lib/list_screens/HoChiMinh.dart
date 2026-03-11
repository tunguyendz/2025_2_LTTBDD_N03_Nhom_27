import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
class HoChiMinhScreen extends StatefulWidget {
  const HoChiMinhScreen({super.key});

  @override
  State<HoChiMinhScreen> createState() => _HoChiMinhScreenState();
}
class _HoChiMinhScreenState extends State<HoChiMinhScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        TravelCard(
          name: "Phố cổ", 
          location: "Hà Nội", 
          imagePath: "assets/imgs/samson.png"
        ),
        TravelCard(name: 'Lăng Bác', location: 'Hà Nội', imagePath: 'assets/imgs/samson.png'),
        TravelCard(name: 'Hồ Gươm', location: 'Hà Nội', imagePath: 'assets/imgs/samson.png'),
        TravelCard(name: 'Văn Miếu', location: 'Hà Nội', imagePath: 'assets/imgs/samson.png')
      ],
    );
  }
  
}