import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';
import 'border_painter.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    required this.title,
    required this.controller,
    required this.hint,
    required this.type,
    required this.icon,
    this.iconSize = 20,
    this.maxLength = 11,
    super.key,
  });

  final String title;
  final String icon;
  final String hint;
  final int maxLength;
  final double iconSize;
  final TextInputType type;
  final TextEditingController controller;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Text(widget.title,
                textAlign: TextAlign.right,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 18),
        CustomPaint(
          painter: GradientBorderPainter(
            strokeWidth: 3,
            gradient: LinearGradient(
              colors: isActive
                  ? [
                      AppColors.foregroundColor,
                      AppColors.foregroundColor,
                      AppColors.foregroundColor2
                    ]
                  : [AppColors.borderColor, AppColors.borderColor],
              begin: Alignment.centerLeft,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height / 14,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  widget.icon,
                  width: widget.iconSize,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  child: VerticalDivider(
                    width: 1,
                    color: Color(0x3A000000),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    child: TextField(
                      controller: widget.controller,
                      autofocus: false,
                      maxLength: widget.maxLength,
                      maxLines: 1,
                      keyboardType: widget.type,
                      decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          hintText: widget.hint,
                          hintStyle: const TextStyle(color: Color(0xb5cccaca))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
