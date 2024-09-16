import 'package:get/get.dart';
import 'package:vaje_yar/feature/auth/presentation/controller/auth_controller.dart';

class AppBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> AuthController());
  }

}