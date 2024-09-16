import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Stack(
              children: [
                // مربع‌های سمت چپ
                SlideTransition(
                  position: _leftAnimation,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 140,
                      height: 140,
                      color: Colors.red,
                    ),
                  ),
                ),
                SlideTransition(
                  position: _leftAnimation,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 140,
                      height: 140,
                      color: Colors.green,
                    ),
                  ),
                ),
                // مربع‌های سمت راست
                SlideTransition(
                  position: _rightAnimation,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 140,
                      height: 140,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SlideTransition(
                  position: _rightAnimation,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 140,
                      height: 140,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
