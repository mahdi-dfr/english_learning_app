import 'package:get/get.dart';
import 'package:vaje_yar/feature/auth/presentation/screen/auth_screen.dart';
import 'package:vaje_yar/feature/home/presentation/screen/exam_screen.dart';

import '../../feature/home/presentation/screen/home_screen.dart';

class RouteHelper{
  RouteHelper._();
  static const String _auth = '/auth';
  static const String _home = '/home';
  static const String _exam = '/exam';

  static String get auth => _auth;
  static String get home => _home;
  static String get exam => _exam;

  static List<GetPage<dynamic>> pages = [
    GetPage(name: auth, page: ()=> AuthScreen()),
    GetPage(name: home, page: ()=> const HomeScreen()),
    GetPage(name: exam, page: ()=> ExamScreen()),
  ];
}