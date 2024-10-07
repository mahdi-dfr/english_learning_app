import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/colors.dart';

class ShowFarsiMeaningButton extends StatelessWidget {
  const ShowFarsiMeaningButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
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
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
    );
  }
}
