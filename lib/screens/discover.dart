import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/list_screens/All.dart';
class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}
class _DiscoverScreenState extends State<DiscoverScreen> {
  int selectedIndex = 0;
  final List<String> categories = ['All', 'Hà Nội', 'Đà Nẵng', 'Hồ Chí Minh', 'Huế', 'Hội An', 'Nha Trang', 'Phú Quốc'];
  final List<Widget> categoryContents = [
    const AllScreen(),
    const Center(child: Text('Địa điểm du lịch bãi biển')),
    const Center(child: Text('Địa điểm du lịch núi')),
    const Center(child: Text('Địa điểm du lịch thành phố')),
    const Center(child: Text('Địa điểm du lịch di tích')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Khám phá địa điểm du lịch',style: TextStyle(color: Colors.greenAccent,fontSize: 25),),
            SizedBox(height: 8),
            Text('Discover', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey[600])),
            
            
          ],
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm địa điểm du lịch',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    suffixIcon: const Icon(Icons.search,color: Colors.greenAccent,),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Stack(
                clipBehavior: Clip.none,//chấm có thể trồi ra ngoài mà không bị khuất,bị cắt mất
                children: [
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: IconButton(onPressed: (){}, icon: const Icon(Icons.tune,size: 20,color: Colors.greenAccent,))
                  ),
                  Positioned(
                    right: -5,
                    top: -5,
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      
                      decoration: BoxDecoration(
                        
                        color: Colors.greenAccent,
                        shape: BoxShape.circle,
                      ),
                      child:const Text('3', style: TextStyle(fontSize: 10, color: Colors.white,),),
                    ),
                  ),
                  
                ],
              )
            ],
          ),
           const SizedBox(height: 20),
  SizedBox(
  height: 40,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: categories.length,
    itemBuilder: (context, index) {
      bool dangDuocChon = (index == selectedIndex); 

      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index; // LỆNH ĐỔI KÊNH LÀ ĐÂY!
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 23),
          child: Text(
            categories[index], // In cái tên ra (All, Asia...)
            style: TextStyle(
              fontSize: 16,
              // TƯ DUY 3: Đổi màu dựa vào biến dangDuocChon
              color: dangDuocChon ? Colors.greenAccent : Colors.grey,
              fontWeight: dangDuocChon ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      );
    },
  ),
)
          ,
          const SizedBox(height: 20),
          Expanded(child: categoryContents[selectedIndex],) // HIỂN THỊ NỘI DUNG DỰA VÀO selectedIndex
          ],
        ),
      ),
    );
  }
}