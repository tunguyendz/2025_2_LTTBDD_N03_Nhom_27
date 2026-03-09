import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}
class _AllScreenState extends State<AllScreen> {

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
      ],
    );
  }
  
}