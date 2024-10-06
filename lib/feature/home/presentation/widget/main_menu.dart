import 'package:flutter/material.dart';
import 'package:vaje_yar/core/utils/colors.dart';
import 'package:vaje_yar/main.dart';

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
                child: MenuItem(title: 'مورد علاقه', icon: Icons.favorite_border,),
              ),
            ),
            SlideTransition(
              position: _leftAnimation,
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: MenuItem(title: 'دسته بندی', icon: Icons.category,),
              ),
            ),
            // مربع‌های سمت راست
            SlideTransition(
              position: _rightAnimation,
              child: const Align(
                alignment: Alignment.topRight,
                child: MenuItem(title: 'کلمات من', icon: Icons.title,),
              ),
            ),
            SlideTransition(
              position: _rightAnimation,
              child: const Align(
                alignment: Alignment.bottomRight,
                child: MenuItem(title: 'وضعیت', icon: Icons.stacked_bar_chart,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      padding: const EdgeInsets.all(12),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 45, color: AppColors.foregroundColor,),
          Text(title, style: const TextStyle(fontSize: 18),)
        ],
      ),
    );
  }
}

