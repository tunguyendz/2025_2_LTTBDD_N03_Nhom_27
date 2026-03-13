import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
import 'package:flutter_ungdungdulich/widgets/SlowRoll.dart';
class NhaTrangScreen extends StatefulWidget {
  const NhaTrangScreen({super.key});

  @override
  State<NhaTrangScreen> createState() => _NhaTrangScreenState();
}
class _NhaTrangScreenState extends State<NhaTrangScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const SlowScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: [
        TravelCard(
          name: "Đảo Điệp Sơn", 
          location: "Nha Trang", 
          imagePath: "assets/imgs/daodiepson.png"
        ),
        TravelCard(name: 'Nhà thờ đá Nha Trang', location: 'Nha Trang', imagePath: 'assets/imgs/nhathoda.png'),
        TravelCard(name: 'Chùa Long Sơn', location: 'Nha Trang', imagePath: 'assets/imgs/chualongson.png'),
        TravelCard(name: 'Vịnh Nha Trang', location: 'Nha Trang', imagePath: 'assets/imgs/vinhnhatrang.png')
      ],
    );
  }
  
}