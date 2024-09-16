import 'package:get/get.dart';
import 'package:vaje_yar/feature/auth/presentation/screen/auth_screen.dart';

import '../../feature/home/presentation/screen/home_screen.dart';

class RouteHelper{
  RouteHelper._();
  static const String _auth = '/auth';
  static const String _home = '/home';

  static String get auth => _auth;
  static String get home => _home;

  static List<GetPage<dynamic>> pages = [
    GetPage(name: auth, page: ()=> AuthScreen()),
    GetPage(name: home, page: ()=> const HomeScreen()),
  ];
}