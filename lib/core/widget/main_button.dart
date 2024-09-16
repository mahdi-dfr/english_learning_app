import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height / 12,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.foregroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    15.0), // Change this value for different border radius
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ));
  }
}
