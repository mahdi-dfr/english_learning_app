import 'package:get/get.dart';

class ExamController extends GetxController {
  var isLiked = false.obs;
  var isBookMarked = false.obs;

  changeFavoriteState() {
    isLiked.toggle();
  }

  changeBookMarkState() {
    isBookMarked.toggle();
  }
}
