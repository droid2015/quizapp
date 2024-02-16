import 'package:flutter/material.dart';
import 'package:quizapp/app/app.bottomsheets.dart';
import 'package:quizapp/app/app.dialogs.dart';
import 'package:quizapp/app/app.locator.dart';
import 'package:quizapp/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/quizz.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    taoData();
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  Future<void> addQuestionToFirestore(Question question) async {
    try {
      // Thêm danh mục câu hỏi vào Firestore
      CollectionReference categoryCollection = FirebaseFirestore.instance.collection('categories');
      categoryCollection.add({            
            'name': question.category.name,
      }).then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

      // Thêm mức độ khó vào Firestore
      final DocumentReference difficultyDocRef =
          await FirebaseFirestore.instance.collection('difficultylevels').add({
        'name': question.difficulty.name,
      });

      // Thêm câu hỏi vào Firestore
      final DocumentReference questionDocRef =
          await FirebaseFirestore.instance.collection('questions').add({
        'text': question.text,
        'categoryId': question.category.id,
        'difficultyId': difficultyDocRef,
      });

      // Thêm đáp án vào Firestore
      for (Answer answer in question.answers) {
        await FirebaseFirestore.instance.collection('answers').add({
          'questionId': questionDocRef,
          'text': answer.text,
          'isCorrect': answer.isCorrect,
        });
      }
    } catch (error) {}
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  void taoData() async {
    // Tạo dữ liệu mẫu
    Category category = Category(id: '1', name: 'General Knowledge');
    DifficultyLevel difficulty = DifficultyLevel(id: '1', name: 'Easy');

    Question question = Question(
      id: '2',
      text: 'What is the capital of VietNam?',
      category: category,
      difficulty: difficulty,
      answers: [
        Answer(id: '1', questionId: '2', text: 'Paris', isCorrect: false),
        Answer(id: '2', questionId: '2', text: 'Hanoi', isCorrect: true),
        Answer(id: '3', questionId: '2', text: 'London', isCorrect: false),
        Answer(id: '4', questionId: '2', text: 'Madrid', isCorrect: false),
      ],
    );
    // Thêm dữ liệu mẫu vào Firestore
    await addQuestionToFirestore(question);
  }
}
