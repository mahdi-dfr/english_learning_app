import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:vaje_yar/core/resource/route_helper.dart';
import 'package:vaje_yar/core/utils/colors.dart';
import 'package:vaje_yar/feature/menu/presentation/widget/swiped_card_widget.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final CardSwiperController controller = CardSwiperController();

  final List<Widget> cards = [
    SwipedCardWidget(),
    SwipedCardWidget(),
    SwipedCardWidget(),
    SwipedCardWidget(),
    SwipedCardWidget(),
    SwipedCardWidget(),
    SwipedCardWidget(),
    SwipedCardWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: ()=>Get.toNamed(RouteHelper.addWord), label: const Row(children: [
        Text('اضافه کردن لغت جدید', style: TextStyle(color: Colors.black),)
      ],), backgroundColor: AppColors.foregroundColor,),
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios_outlined)),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: cards.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                numberOfCardsDisplayed: 3,
                backCardOffset: const Offset(40, 40),
                padding: const EdgeInsets.all(24.0),
                cardBuilder: (
                    context,
                    index,
                    horizontalThresholdPercentage,
                    verticalThresholdPercentage,
                    ) =>
                cards[index],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
      int previousIndex,
      int? currentIndex,
      CardSwiperDirection direction,
      ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
      int? previousIndex,
      int currentIndex,
      CardSwiperDirection direction,
      ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
