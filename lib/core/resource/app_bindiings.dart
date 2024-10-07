import 'package:get/get.dart';
import 'package:vaje_yar/feature/auth/presentation/controller/auth_controller.dart';
import 'package:vaje_yar/feature/home/presentation/controller/exam_controller.dart';
import 'package:vaje_yar/feature/menu/presentation/controller/book_mark_controller.dart';

class AppBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> AuthController());
    Get.lazyPut(()=> ExamController(), fenix: true);
    Get.lazyPut(()=> BookMarkController(), fenix: true);
  }

}