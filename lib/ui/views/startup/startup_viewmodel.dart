import 'package:quizapp/models/quizz.dart';
import 'package:stacked/stacked.dart';
import 'package:quizapp/app/app.locator.dart';
import 'package:quizapp/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    //await Future.delayed(const Duration(seconds: 3));
    // Tạo một đối tượng ChucNang mới
  //khoitaoData();

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithHomeView();
  }

  void khoitaoData() {
    ChucNang newChucNang = ChucNang(
      idChucNang: '1',
      tenHienThi: 'Danh mục dùng chung',
      thuTu: 1,
      idParent: 0,
      iconName: 'icon_name',
      functionName: 'function_name',
      indexPage: 1,
      module: 'module_name',
      maChucNang: 'ma_chuc_nang',
      isQuanTri: false,
    );
    // Thêm chức năng vào Firestore
    newChucNang.addChucNangToFirestore(newChucNang);
    newChucNang = ChucNang(
      idChucNang: '2',
      tenHienThi: 'Loại câu hỏi',
      thuTu: 1,
      idParent: 1,
      iconName: 'icon_name',
      functionName: 'function_name',
      indexPage: 1,
      module: 'module_name',
      maChucNang: 'ma_chuc_nang',
      isQuanTri: false,
    );
    newChucNang.addChucNangToFirestore(newChucNang);
    newChucNang = ChucNang(
      idChucNang: '3',
      tenHienThi: 'Độ khó câu hỏi',
      thuTu: 1,
      idParent: 1,
      iconName: 'icon_name',
      functionName: 'function_name',
      indexPage: 1,
      module: 'module_name',
      maChucNang: 'ma_chuc_nang',
      isQuanTri: false,
    );
    newChucNang.addChucNangToFirestore(newChucNang);
  }
}
