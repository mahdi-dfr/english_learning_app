import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vaje_yar/core/utils/colors.dart';

class FlipCard extends StatefulWidget {
  const FlipCard({super.key});

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  bool isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void _flipCard() {
    if (isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    isFront = !isFront;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height / 3,
      child: GestureDetector(
        onTap: _flipCard,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final angle = _animation.value * pi; // Rotate from 0 to π radians
            bool isCurrentlyFront = angle < pi / 2;

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              child: isCurrentlyFront ? _buildFrontCard() : _buildBackCard(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFrontCard() {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
          color: AppColors.foregroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(3, 5),
              blurRadius: 0,
              spreadRadius: 1,
            )
          ]),
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'angel',
            style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
          ),

        ],
      ),
    );
  }

  Widget _buildBackCard() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(pi),
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(3, 5),
                blurRadius: 0,
                spreadRadius: 1,
              )
            ]),
        alignment: Alignment.center,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'a spiritual being believed to act as an attendant, agent, or messenger of God, conventionally represented in human form with wings and a long robe.',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
