import 'package:dio/dio.dart' as d;
import 'package:get/state_manager.dart';

import '../helpers/logger.dart';
import '../models/product_model.dart';
import '../services/client.dart';
import '../services/client_impl.dart';

class ProductController extends GetxController {
  RxBool isLoading = RxBool(false);
  RxList<ProductModel> productList = RxList([]);
  HttpClientImpl? httpClientImpl;

  @override
  void onInit() {
    httpClientImpl = HttpClientImpl();
    fetchProducts();
    super.onInit();
  }

  /// Handle states of request such as loading
  void fetchProducts() async {
    try {
      isLoading.value = true;
      isLoading.refresh();
      final result =
          await httpClientImpl?.request(url: "products", method: Method.GET);
      if (result != null) {
        if (result is d.Response) {
          var products = List<ProductModel>.from(
              (result.data).map((x) => ProductModel.fromJson(x)));
          productList.value = products;
          LoggerHelper.logger.d(products);
        } else {
          isLoading.value = false;
        }
      }
    } finally {
      isLoading.value = false;
    }
    isLoading.refresh();
  }
}
