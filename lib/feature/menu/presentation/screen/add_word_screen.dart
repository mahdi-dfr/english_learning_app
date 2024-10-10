import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaje_yar/core/widget/custom_text_field.dart';

class AddWordScreen extends StatelessWidget {
  const AddWordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios_outlined)),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('نام لغت'),
                CustomTextInput(textController: , prefixIcon: Icons.abc),
                // Container(
                //   width: width,
                //   height: height/12,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8),
                //     border: Border.all(width: 1, color: Colors.black)
                //   ),
                // )
              ],
            ),
          )
      ),
    );
  }
}
