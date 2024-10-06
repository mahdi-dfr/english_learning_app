import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/utils/colors.dart';
import '../widget/flip_card.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColors.backgroundColor));

    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text('روی کارت بزن تا معنی رو ببینی'),
              const SizedBox(
                height: 20,
              ),
              const FlipCard(),
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.do_not_disturb_sharp,
                            size: 50,
                            color: Colors.black,
                          )),
                      const Text('اشتباه جواب دادم')
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.check,
                            size: 50,
                            color: Colors.black,
                          )),
                      const Text('درست جواب دادم')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      backgroundColor: AppColors.foregroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: const BorderSide(color: Colors.black, width: 3), // Retro border
                      ),
                    ),
                    child: const Text(
                      'مشاهده معنی فارسی',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        letterSpacing: 2,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
