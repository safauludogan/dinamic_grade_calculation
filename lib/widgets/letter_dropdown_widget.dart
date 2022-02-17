import 'package:flutter/material.dart';

import '../constants/app_constant.dart';
import '../helper/data_helper.dart';

class LetterDropdownWidget extends StatefulWidget {
  final Function onLetterSelected;

  const LetterDropdownWidget({required this.onLetterSelected, Key? key})
      : super(key: key);

  @override
  _LetterDropdownWidgetState createState() => _LetterDropdownWidgetState();
}

class _LetterDropdownWidgetState extends State<LetterDropdownWidget> {
  double selectedLetterValue = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropdownPadding,
      decoration: BoxDecoration(
        color: Constants.baseColor.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        value: selectedLetterValue,
        elevation: 16,
        iconEnabledColor: Constants.baseColor.shade200,
        onChanged: (value) {
          setState(() {
            selectedLetterValue = value!;
            widget.onLetterSelected(selectedLetterValue);
          });
        },
        underline: Container(),
        items: DataHelper.allLessonsLetter(),
      ),
    );
  }
}
