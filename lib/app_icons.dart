import 'package:flutter/widgets.dart';

class AppIcons {
  AppIcons._(); // Để không cho phép khởi tạo class này

  static const String _fontFamily = 'MyTravelIcons'; // Phải trùng với tên family trong pubspec.yaml

  // Dựa theo ảnh bạn gửi
  static const IconData userPen = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData reservationTable = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData discover = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData houseChimney = IconData(0xe903, fontFamily: _fontFamily);
}