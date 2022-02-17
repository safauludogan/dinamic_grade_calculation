import 'package:flutter/material.dart';

import '../model/lesson.dart';

class DataHelper {
  static List<Lesson> allAddingLessons = [];

  static addLesson(Lesson lesson) {
    allAddingLessons.add(lesson);
  }

  static List<String> _allLessonLetters() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double calculateGrade() {
    double totalNote = 0;
    double totalCredit = 0;

    allAddingLessons.forEach((element) {
      totalNote += (element.creditValue * element.letterValue);
      totalCredit += element.creditValue;
    });
    return totalNote / totalCredit;
  }

  static double _convertLetterToNote(String letter) {
    switch (letter) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLessonsLetter() {
    return _allLessonLetters()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _convertLetterToNote(e),
            ))
        .toList();
  }

  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCredits() {
    return _allCredits()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }
}
