import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vaje_yar/core/resource/route_helper.dart';

class AuthController extends GetxController{

  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();
  final isPhoneNumberFieldState = true.obs;

  Future<void> animateFields() async {
    if(isPhoneNumberFieldState.value){
      isPhoneNumberFieldState.value = false;
    }else{
      Get.toNamed(RouteHelper.home);
    }
  }
}