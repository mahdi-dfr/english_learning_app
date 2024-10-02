import 'package:flutter/material.dart';

class MainMenuWidget extends StatefulWidget {
  const MainMenuWidget({super.key});

  @override
  State<MainMenuWidget> createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _leftAnimation;
  late Animation<Offset> _rightAnimation;

  @override
  void initState() {
    super.initState();

    // تنظیم AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    // تنظیم Tween برای مربع‌های سمت چپ که از چپ وارد می‌شوند
    _leftAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0.0), // از بیرون سمت چپ
      end: Offset.zero, // به موقعیت اصلی
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // تنظیم Tween برای مربع‌های سمت راست که از راست وارد می‌شوند
    _rightAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0.0), // از بیرون سمت راست
      end: Offset.zero, // به موقعیت اصلی
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // شروع انیمیشن هنگام نمایش صفحه
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Stack(
          children: [
            // مربع‌های سمت چپ
            SlideTransition(
              position: _leftAnimation,
              child: const Align(
                alignment: Alignment.topLeft,
                child: MenuItem(),
              ),
            ),
            SlideTransition(
              position: _leftAnimation,
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: MenuItem(),
              ),
            ),
            // مربع‌های سمت راست
            SlideTransition(
              position: _rightAnimation,
              child: const Align(
                alignment: Alignment.topRight,
                child: MenuItem(),
              ),
            ),
            SlideTransition(
              position: _rightAnimation,
              child: const Align(
                alignment: Alignment.bottomRight,
                child: MenuItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MenuItem extends StatelessWidget {
  const MenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.black),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 5),
            blurRadius: 0,
            spreadRadius: 1,
          )
        ]
      ),
    );
  }
}

