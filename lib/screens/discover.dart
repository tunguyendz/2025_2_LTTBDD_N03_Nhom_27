import 'package:flutter/material.dart';
class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}
class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Khám phá địa điểm du lịch',style: TextStyle(color: Colors.green),),
            Text('Discover', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            
          ],
        )
      ),
      body: const Center(
        child: Text('Discover Screen'),
      ),
    );
  }
}