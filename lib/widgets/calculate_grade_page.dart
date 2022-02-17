import 'package:dinamic_grade_calculation/helper/data_helper.dart';
import 'package:dinamic_grade_calculation/widgets/credit_dropdown_widget.dart';
import 'package:dinamic_grade_calculation/widgets/lesson_list.dart';
import 'package:dinamic_grade_calculation/widgets/letter_dropdown_widget.dart';
import 'package:dinamic_grade_calculation/widgets/show_average.dart';
import 'package:flutter/material.dart';

import '../constants/app_constant.dart';
import '../model/lesson.dart';

class CalculateGradePage extends StatefulWidget {
  const CalculateGradePage({Key? key}) : super(key: key);

  @override
  _CalculateGradePageState createState() => _CalculateGradePageState();
}

class _CalculateGradePageState extends State<CalculateGradePage> {
  var formKey = GlobalKey<FormState>();
  double selectedCredit = 1;
  double selectedLetterValue = 4;
  String enteredLessonName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //Telefon yan çevrildiği zaman çıkan sarı şeridi kapatır.
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Constants.headText,
            style: Constants.headStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: ShowAverage(
                    lessonCount: DataHelper.allAddingLessons.length,
                    average: DataHelper.calculateGrade()),
              )
            ],
          ),
          Expanded(
            child: LessonList(
              onDismiss: (index) {
                DataHelper.allAddingLessons.removeAt(index);
                setState(() {});
              },
            ),
          ),
          //form
          //liste
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Constants.horizontalPadding8,
            child: _buildTextFormField(),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Constants.horizontalPadding8,
                  child: LetterDropdownWidget(
                    onLetterSelected: (letter) {
                      selectedLetterValue=letter;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constants.horizontalPadding8,
                  child: CreditDropdownWidget(
                    onSelected:(value){
                      selectedCredit = value;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _addLessonAndCalculate,
                icon: const Icon(Icons.arrow_forward_ios),
                color: Constants.baseColor,
                iconSize: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          enteredLessonName = value!;
        });
      },
      validator: (s) {
        if (s!.isEmpty) {
          return 'Ders adını giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Matematik',
        border: OutlineInputBorder(
            borderRadius: Constants.borderRadius,
            borderSide: BorderSide.none //TextForm'un kenarlıklarını siliyoruz.
            ),
        filled: true,
        fillColor: Constants.baseColor.shade100.withOpacity(0.3),
      ),
    );
  }

  void _addLessonAndCalculate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var willAddedLesson = Lesson(
          name: enteredLessonName,
          letterValue: selectedLetterValue,
          creditValue: selectedCredit);
      DataHelper.addLesson(willAddedLesson);
      setState(() {});
    }
  }
}
