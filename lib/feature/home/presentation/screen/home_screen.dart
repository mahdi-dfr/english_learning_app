import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vaje_yar/core/utils/colors.dart';
import 'package:vaje_yar/feature/home/presentation/widget/main_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColors.foregroundColor));

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Stack(children: [
            Container(
              width: width,
              height: height / 4 + 5,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
            Container(
              width: width,
              height: height / 4,
              decoration: BoxDecoration(
                color: AppColors.foregroundColor,
              ),
            ),
          ]),
          const SizedBox(
            height: 100,
          ),
          const MainMenuWidget()
        ],
      )),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);

    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 50);

    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
