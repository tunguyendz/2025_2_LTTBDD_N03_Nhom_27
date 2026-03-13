import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
import 'package:flutter_ungdungdulich/widgets/SlowRoll.dart';
class PhuQuocScreen extends StatefulWidget {
  const PhuQuocScreen({super.key});

  @override
  State<PhuQuocScreen> createState() => _PhuQuocScreenState();
}
class _PhuQuocScreenState extends State<PhuQuocScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const SlowScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: [
        TravelCard(
          name: "VinWonders", 
          location: "Phú Quốc", 
          imagePath: "assets/imgs/vinwonders.png"
        ),
        TravelCard(name: 'Grand Worldc', location: 'Phú Quốc', imagePath: 'assets/imgs/grandworld.png'),
        TravelCard(name: 'Cầu hoàng hôn', location: 'Phú Quốc', imagePath: 'assets/imgs/cauhoanghon.png'),
        TravelCard(name: 'Hòn Móng Tay', location: 'Phú Quốc', imagePath: 'assets/imgs/honmongtay.png')
      ],
    );
  }
  
}