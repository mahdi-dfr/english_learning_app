import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vaje_yar/core/utils/image_route.dart';
import 'package:vaje_yar/core/widget/main_button.dart';
import 'package:vaje_yar/feature/auth/presentation/controller/auth_controller.dart';

import '../../../../core/widget/custom_text_field.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .sizeOf(context)
        .width;
    var height = MediaQuery
        .sizeOf(context)
        .height;
    return Scaffold(
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: SizedBox(
                  width: MediaQuery
                      .sizeOf(context)
                      .width,
                  height: MediaQuery
                      .sizeOf(context)
                      .height,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 0,
                        right: 0,
                        child: SvgPicture.asset(
                          ImagesRoute.login,
                          width: width * 0.7,
                        ),
                      ),
                      Positioned(
                        top: 300,
                        left: 0,
                        right: 0,
                        child: Obx(() {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              final offsetAnimation = Tween<Offset>(
                                begin: child.key == const ValueKey(1)
                                    ? const Offset(-1.0, 0.0)
                                    : const Offset(1.0, 0.0),
                                end: const Offset(0.0, 0.0),
                              ).animate(animation);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                            child: _controller.isPhoneNumberFieldState.value
                                ? Row(
                              key: const ValueKey(1),
                              children: [
                                const SizedBox(width: 10),
                                Expanded(
                                  child: CustomTextInput(
                                      title: 'لطفا شماره موبایل خود را وارد کنید',
                                      textController:
                                      _controller.phoneNumberController,
                                      prefixIcon: ImagesRoute.phoneIcon),
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            )
                                : Row(
                              key: const ValueKey(2),
                              children: [
                                const SizedBox(width: 10),
                                Expanded(
                                  child: CustomTextInput(
                                      title: 'لطفا کد پیامک شده را وارد کنید',
                                      textController:
                                      _controller.otpController,
                                      prefixIcon: ImagesRoute.passwordIcon),
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Obx(() {
                          return MainButton(
                              title: _controller.isPhoneNumberFieldState.value
                                  ? 'مرحله بعد'
                                  : 'ورود به برنامه',
                              onPressed: _controller.animateFields);
                        }),
                      )
                    ],
                  )),
            )));
  }
}
