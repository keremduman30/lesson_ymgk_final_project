import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ymgk_final_project/core/init/notifier/application_provider.dart';
import 'package:ymgk_final_project/feature/splash/view/splash_view.dart';
   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MultiBlocProvider(
    providers: [...ApplicationBlocProvider.instance.dependItems],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'YMGK FINAL PROJECT',
      theme: ThemeData(primarySwatch: Colors.blue),
      navigatorKey: navigatorKey,
      home: const SplashView(),
    );
  }
}
