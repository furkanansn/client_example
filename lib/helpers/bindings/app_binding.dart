import 'package:client_example/controllers/product_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
