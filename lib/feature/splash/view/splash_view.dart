import 'package:flutter/material.dart';
import 'package:ymgk_final_project/core/constant/app/image_constant.dart';
import 'package:ymgk_final_project/core/extension/context_extension.dart';
import 'package:ymgk_final_project/feature/home/view/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 850))
        .then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeView()), (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(padding: context.paddingHigh, height: 350, child: Image.asset(ImageConstant.instance.grafic, fit: BoxFit.cover)),
      ),
    );
  }
}
