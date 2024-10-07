import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaje_yar/core/utils/colors.dart';
import 'package:vaje_yar/core/utils/constants.dart';

import '../../../../core/widget/like_bookmark_widget.dart';
import '../controller/book_mark_controller.dart';

class SwipedCardWidget extends StatelessWidget {
  SwipedCardWidget({super.key});

  final _controller = Get.find<BookMarkController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.foregroundColor,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          border: Border.all(width: 2, color: Colors.black)),
      child: Column(
        children: [
          const SizedBox(
            width: 260,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'angel',
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                ),
                Text(
                  'a spiritual being believed to act as an attendant, agent, or messenger of God, conventionally represented in human form with wings and a long robe.',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(() {
                return BookMarkWidget(
                    state: _controller.isBookMarked.value,
                    onPressed: () => _controller.changeBookMarkState());
              }),

              IconButton(onPressed: (){
                Get.snackbar(
                  '',
                  '',
                  snackPosition: SnackPosition.BOTTOM,
                  maxWidth: 200,
                  titleText: const Text('فرشته',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  margin: const EdgeInsets.only(bottom: 10),
                );
              }, icon: const Icon(Icons.translate, color: Colors.black, size: 30,)),

              Obx(() {
                return LikeWidget(
                    state: _controller.isLiked.value, onPressed: () => _controller.changeFavoriteState());
              }),
            ],
          )
        ],
      ),
    );
  }
}
