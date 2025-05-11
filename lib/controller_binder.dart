import 'package:get/get.dart';
import 'package:my_todo_list/viewmodel/date_time_viewmodel.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(DateTimeViewmodel());
  }
}
