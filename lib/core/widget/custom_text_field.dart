import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {super.key,
      required this.textController,
      required this.prefixIcon,
      this.title = ''});

  final String prefixIcon;
  final String title;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: MediaQuery.sizeOf(context).height / 14,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 2, color: Colors.black),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(3, 5),
                  blurRadius: 0,
                  spreadRadius: 1,
                )
              ]),
          child: Row(
            children: [
              SvgPicture.asset(prefixIcon),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: VerticalDivider(
                  width: 0.5,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: TextFormField(
                  maxLines: 1,
                  controller: textController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
