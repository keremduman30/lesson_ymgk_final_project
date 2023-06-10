import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ymgk_final_project/core/base/view_model/base_view_model.dart';
import 'package:ymgk_final_project/feature/home/cubit/home_state.dart';

import '../../../core/components/card/game_alert_dialog.dart';
import '../../../core/components/card/getx/locale_getx_snackbar.dart';

class HomeViewModel extends Cubit<HomeState> with BaseViewModel {
  HomeViewModel() : super(const HomeState());

  late List<TextEditingController> textFormList;
  late GlobalKey<FormState> formkey;

  @override
  void init() {
    formkey = GlobalKey();
    textFormList = List.generate(5, (index) => TextEditingController());
  }

  void startGame() {
    emit(const HomeState(gameList: [7, 6, 5, 5, 2]));
  }

  void refreshGame() {
    Random rnd = Random();
    int gameList0, gameList1, gameList2, gameList3, gameList4;

    gameList1 = rnd.nextInt(7) + 1; 
    gameList0 = gameList1 + 1; 

    gameList4 = rnd.nextInt(7) + 1;

    int sameRandom = rnd.nextInt(7) + 1; 
    gameList2 = sameRandom; 
    gameList3 = sameRandom; 

    while (gameList2 == gameList4 || gameList2 == gameList1 || gameList3 == gameList1) {
      sameRandom = rnd.nextInt(7) + 1; 
      gameList2 = sameRandom; 
      gameList3 = sameRandom; 
    }

    emit(HomeState(gameList: [gameList0, gameList1, gameList2, gameList3, gameList4]));
  }

  void onpressedResult(BuildContext context) {
    final problem = formkey.currentState?.validate();
    List<int> textFormListInt = [
      textFormList[0].text.toInt(),
      textFormList[1].text.toInt(),
      textFormList[2].text.toInt(),
      textFormList[3].text.toInt(),
      textFormList[4].text.toInt()
    ];
    final gameList = context.read<HomeViewModel>().state.gameList;
    if (problem!) {
      if (compareLists(gameList ?? [], textFormListInt)) {
        GameAlertDialog.instance.showAlertDialog(context);
        for (var i = 0; i < textFormList.length; i++) {
          textFormList[i].clear();
        }
      } else {
        LocalGetSnackBar.localeGetSnackBar(message: "Yanlış Cevap ! Lütfen tekrar deneyiniz");
      }
    } else {
      LocalGetSnackBar.localeGetSnackBar(message: "Lütfen Tum boslukları doldurun");
    }
  }

  bool compareLists(List<int> list1, List<int> list2) {
    if (list1.length != list2.length) {
      return false;
    }

    for (var i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) {
        return false;
      }
    }

    return true;
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;
}

extension _StringtOInt on String {
  int toInt() => int.tryParse(this) ?? 0;
}
