import 'package:client_example/views/home_view.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: "/",
      page: () => const HomeView(),
      transition: Transition.downToUp,
    ),
    
  ];
}
