import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature/home/cubit/home_view_model.dart';

class GameAlertDialog {
  static GameAlertDialog? _instace;
  static GameAlertDialog get instance {
    _instace ??= GameAlertDialog._init();
    return _instace!;
  }

  GameAlertDialog._init();
  showAlertDialog(BuildContext context) {
    // dialog tanımlama
    AlertDialog alert = AlertDialog(
      title: buildTitle(),
      // content:const  Text("İçerik"),
      actions: [
        // Butonlar
        buidlExitBtn(context),
        buildRefreshBtn(context),
      ],
    );

    // dialogu gösterme
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget buildRefreshBtn(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<HomeViewModel>().refreshGame();
          Navigator.pop(context);
        },
        child: const Text("Yeni Oyun"));
  }

  Widget buidlExitBtn(BuildContext context) {
    return ElevatedButton(
      child: const Text("Çıkış"),
      onPressed: () {
        Navigator.of(context).pop();
        exit(0);
      },
    );
  }

  Widget buildTitle() => const Text("Tebrikler Kazandınız");
}
