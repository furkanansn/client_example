import 'package:client_example/controllers/product_controller.dart';
import 'package:client_example/widgets/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeView extends GetView<ProductController> {
  static const route = "/";
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(
      () {
        if (controller.isLoading.value) {
          return const Center(child: CupertinoActivityIndicator());
        }
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                childAspectRatio: 10 / 16),
            itemCount: controller.productList.length,
            itemBuilder: (context, i) {
              return ProductTile(controller.productList[i]);
            });
      },
    ));
  }
}
