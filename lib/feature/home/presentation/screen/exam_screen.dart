import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vaje_yar/core/widget/like_bookmark_widget.dart';
import 'package:vaje_yar/feature/home/presentation/controller/exam_controller.dart';

import '../../../../core/utils/colors.dart';
import '../widget/show_farsi_meanuing_button.dart';
import '../widget/flip_card.dart';

class ExamScreen extends StatelessWidget {
  ExamScreen({super.key});

  final _controller = Get.find<ExamController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColors.backgroundColor));

    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: ()=> Get.back(), icon: const Icon(Icons.arrow_back_ios_outlined)),),
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
              AnimatedSwitcher(duration: Duration(milliseconds: 500),

              child: const FlipCard(key: ValueKey('1'),)),
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
                  Obx(() {
                    return BookMarkWidget(state: _controller.isBookMarked.value, onPressed:()=> _controller.changeBookMarkState());
                  }),
                  Obx(() {
                    return LikeWidget(state: _controller.isLiked.value, onPressed:()=> _controller.changeFavoriteState());
                  }),
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
              const ShowFarsiMeaningButton()
            ],
          ),
        ),
      ),
    );
  }
}
