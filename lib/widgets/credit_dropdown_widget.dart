

import 'package:flutter/material.dart';

import '../constants/app_constant.dart';
import '../helper/data_helper.dart';

class CreditDropdownWidget extends StatefulWidget {
  final Function onSelected;
  const CreditDropdownWidget({required this.onSelected,Key? key}) : super(key: key);

  @override
  _CreditDropdownWidgetState createState() => _CreditDropdownWidgetState();
}

class _CreditDropdownWidgetState extends State<CreditDropdownWidget> {
  double selectedCredit = 1;

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
        value: selectedCredit,
        elevation: 16,
        iconEnabledColor: Constants.baseColor.shade200,
        onChanged: (value) {
          selectedCredit = value!;
          setState(() {
            widget.onSelected(selectedCredit);
          });
        },
        underline: Container(),
        items: DataHelper.allCredits(),
      ),
    );
  }
}
