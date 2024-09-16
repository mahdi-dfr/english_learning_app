import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vaje_yar/core/resource/route_helper.dart';

class AuthController extends GetxController{

  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();
  final isNumberFieldState = true.obs;

  Future<void> animateFields() async {
    if(isNumberFieldState.value){
      isNumberFieldState.value = false;
    }else{
      Get.toNamed(RouteHelper.home);
    }
  }
}