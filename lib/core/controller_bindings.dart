import 'package:get/get.dart';
import 'package:my_todo_list/features/todo_activity/viewmodel/bottom_nav_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
  }
}
