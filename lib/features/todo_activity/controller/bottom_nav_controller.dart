import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int currentIndex = 0;

  void onChanged(int idx) {
    print(currentIndex);
    currentIndex = idx;
    print(idx);
    update();
  }
}
