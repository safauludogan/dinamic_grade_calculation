import 'package:dinamic_grade_calculation/widgets/calculate_grade_page.dart';
import 'package:flutter/material.dart';

import 'constants/app_constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamik Ortalama Hesapla',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Constants.baseColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,//Ortamlara göre kendisini ayarlıyor
      ),
      home: const CalculateGradePage(),
    );
  }
}
