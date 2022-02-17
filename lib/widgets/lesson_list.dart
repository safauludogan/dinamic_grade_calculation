import 'package:dinamic_grade_calculation/constants/app_constant.dart';
import 'package:dinamic_grade_calculation/helper/data_helper.dart';
import 'package:dinamic_grade_calculation/model/lesson.dart';
import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;//Bu yapı ile dışardaki stateless widget'den ana widget'a callback yapısı ile setState işlemi yapıyoruz.
  const LessonList({required this.onDismiss,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLessons = DataHelper.allAddingLessons;
    return allLessons.isNotEmpty
        ? ListView.builder(
        itemCount: allLessons.length,
        itemBuilder: (context, index) {
          return Dismissible(//Kaydırarak silme efekti
            key: UniqueKey(),//Her bir satıra ayrı ayrı Uniq key atayarak verileri bir birinden ayırma işlemi yapıyor
            direction: DismissDirection.startToEnd,//Soldan sağa doğru kaydırarak silme işlemi
            onDismissed: (a){
              onDismiss(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                child: ListTile(
                  title: Text(allLessons[index].name),
                  leading: CircleAvatar(
                    backgroundColor: Constants.baseColor,
                    child: Text((allLessons[index].letterValue *
                        allLessons[index].creditValue)
                        .toStringAsFixed(0)),
                  ),
                  subtitle: Text(
                      '${allLessons[index].creditValue} Kredi, Not Değeri ${allLessons[index].letterValue}'),
                ),
              ),
            ),
          );
        })
        : Center(child: Text('Lütfen ders ekleyin',style: Constants.headStyle,));
  }
}

