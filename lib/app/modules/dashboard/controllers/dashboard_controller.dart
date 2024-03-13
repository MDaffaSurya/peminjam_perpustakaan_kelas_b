import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
