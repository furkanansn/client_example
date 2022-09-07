import 'package:client_example/helpers/bindings/app_binding.dart';
import 'package:client_example/routes/app_pages.dart';
import 'package:client_example/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Client Example',
      theme: ThemeData(      
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeView.route,
      initialBinding: AppBinding(),  
      getPages: AppPages.pages,    
    );
  }
}
