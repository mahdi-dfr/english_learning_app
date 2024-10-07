import 'package:flutter/material.dart';

class LikeWidget extends StatelessWidget {
  const LikeWidget({super.key, required this.state, required this.onPressed});

  final bool state;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: state
            ? const Icon(
          Icons.favorite,
          size: 30,
          color: Colors.black,
        )
            : const Icon(
          Icons.favorite_border,
          size: 30,
          color: Colors.black,
        ));
  }
}


class BookMarkWidget extends StatelessWidget {
  const BookMarkWidget({super.key, required this.state, required this.onPressed});

  final bool state;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: state
            ? const Icon(
          Icons.bookmark,
          size: 30,
          color: Colors.black,
        )
            : const Icon(
          Icons.bookmark_border_rounded,
          size: 30,
          color: Colors.black,
        ));
  }
}
