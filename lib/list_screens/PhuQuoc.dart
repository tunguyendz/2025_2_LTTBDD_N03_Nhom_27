import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
class PhuQuocScreen extends StatefulWidget {
  const PhuQuocScreen({super.key});

  @override
  State<PhuQuocScreen> createState() => _PhuQuocScreenState();
}
class _PhuQuocScreenState extends State<PhuQuocScreen> {

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