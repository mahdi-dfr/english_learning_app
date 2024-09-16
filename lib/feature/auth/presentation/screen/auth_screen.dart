import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vaje_yar/core/utils/colors.dart';
import 'package:vaje_yar/core/utils/image_route.dart';
import 'package:vaje_yar/core/widget/main_button.dart';
import 'package:vaje_yar/feature/auth/presentation/controller/auth_controller.dart';

import '../../../../core/widget/input_item.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Stack(children: [
                  Positioned(
                    top: -400,
                    left: -350,
                    child: Image.asset(
                      ImagesRoute.backImg,
                    ),
                  ),
                  Positioned(
                    bottom: -450,
                    right: -350,
                    child: Image.asset(
                      ImagesRoute.backImg,
                    ),
                  ),
                  Positioned(
                      top: 60,
                      left: 20,
                      right: 20,
                      child: Column(children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Image.asset(
                              ImagesRoute.introductionImg,
                              width: 300,
                            )),
                        const SizedBox(
                          height: 60,
                        ),
                        Obx(() {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              // تنظیم انیمیشن برای خروج از چپ و ورود از راست
                              final offsetAnimation = Tween<Offset>(
                                begin: child.key == const ValueKey(1)
                                    ? const Offset(
                                        -1.0, 0.0) // فیلد اول از چپ خارج شود
                                    : const Offset(1.0, 0.0),
                                // فیلد دوم از راست وارد شود
                                end: const Offset(0.0, 0.0),
                              ).animate(animation);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                            child: _controller.isNumberFieldState.value
                                ? Row(
                                    key: const ValueKey(1),
                                    children: [
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: TextInputField(
                                          title:
                                              'لطفا شماره موبایل خود را وارد کنید',
                                          controller:
                                              _controller.phoneNumberController,
                                          hint: '09120000000',
                                          type: TextInputType.number,
                                          icon: ImagesRoute.phoneIcon,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                    ],
                                  )
                                : Row(
                                    key: const ValueKey(2),
                                    children: [
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: TextInputField(
                                          title:
                                              'لطفا کد پیامک شده را وارد کنید',
                                          controller: _controller.otpController,
                                          hint: '*****',
                                          maxLength: 5,
                                          type: TextInputType.number,
                                          icon: ImagesRoute.passwordIcon,
                                          iconSize: 25,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                    ],
                                  ),
                          );
                        }),
                      ])),
                  Positioned(
                    bottom: 20,
                    left: 40,
                    right: 40,
                    child: Obx(() {
                      return MainButton(
                          text: _controller.isNumberFieldState.value
                              ? 'تایید'
                              : 'ورود به برنامه',
                          onPressed: _controller.animateFields);
                    }),
                  )
                ]))));
  }
}
