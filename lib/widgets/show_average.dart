import 'package:flutter/cupertino.dart';

import '../constants/app_constant.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int lessonCount;

  const ShowAverage(
      {required this.average, required this.lessonCount, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lessonCount > 0 ? '$lessonCount Ders girildi' : 'Ders seçiniz',
          style: Constants.showAverageBodyStyle,
        ),
        Text(
          average >= 0 ? average.toStringAsFixed(2) : '0.0',//Virgülden sonra 2 basamak göster
          style: Constants.averageStyle,
        ),
        Text('Ortalama',style: Constants.showAverageBodyStyle),
      ],
    );
  }
}
