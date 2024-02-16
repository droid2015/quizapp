import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String id;
  String name;

  Category({required this.id, required this.name});
}

class DifficultyLevel {
  String id;
  String name;

  DifficultyLevel({required this.id, required this.name});
}

class Question {
  String id;
  String text;
  Category category;
  DifficultyLevel difficulty;
  List<Answer> answers;

  Question({
    required this.id,
    required this.text,
    required this.category,
    required this.difficulty,
    required this.answers,
  });
}

class Answer {
  String id;
  String questionId;
  String text;
  bool isCorrect;

  Answer({required this.id, required this.questionId, required this.text, required this.isCorrect});
}
class ChucNang {
  final String idChucNang;
  final String tenHienThi;
  final int thuTu;
  final int idParent;
  final String iconName;
  final String functionName;
  final int indexPage;
  final String module;
  final String maChucNang;
  final bool isQuanTri;

  ChucNang({
    required this.idChucNang,
    required this.tenHienThi,
    required this.thuTu,
    required this.idParent,
    required this.iconName,
    required this.functionName,
    required this.indexPage,
    required this.module,
    required this.maChucNang,
    required this.isQuanTri,
  });
  Map<String, dynamic> toMap() {
    return {
      'tenHienThi': tenHienThi,
      'thuTu': thuTu,
      'idParent': idParent,
      'iconName': iconName,
      'functionName': functionName,
      'indexPage': indexPage,
      'module': module,
      'maChucNang': maChucNang,
      'isQuanTri': isQuanTri,
    };
  }
  factory ChucNang.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ChucNang(
      idChucNang: doc.id,
      tenHienThi: data['tenHienThi'],
      thuTu: data['thuTu'],
      idParent: data['idParent'],
      iconName: data['iconName'],
      functionName: data['functionName'],
      indexPage: data['indexPage'],
      module: data['module'],
      maChucNang: data['maChucNang'],
      isQuanTri: data['isQuanTri'],
    );
  }
  Future<void> addChucNangToFirestore(ChucNang chucNang) async {
  try {
    await FirebaseFirestore.instance.collection('chucnang').doc(chucNang.idChucNang).set(chucNang.toMap());
    print('Thêm chức năng thành công.');
  } catch (error) {
    print('Lỗi khi thêm chức năng vào Firestore: $error');
  }
}

}