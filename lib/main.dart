import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/resource/app_bindiings.dart';
import 'core/resource/route_helper.dart';
import 'core/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.auth,
      initialBinding: AppBindings(),
      getPages: RouteHelper.pages,
      theme: ThemeData(fontFamily: 'IranSans', scaffoldBackgroundColor: AppColors.backgroundColor),
    );
  }
}