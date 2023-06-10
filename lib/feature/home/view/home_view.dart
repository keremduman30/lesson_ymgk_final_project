import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ymgk_final_project/core/base/view/base_view.dart';
import 'package:ymgk_final_project/core/constant/app/application_constant.dart';
import 'package:ymgk_final_project/core/constant/app/color_constant.dart';
import 'package:ymgk_final_project/core/constant/app/image_constant.dart';
import 'package:ymgk_final_project/core/extension/context_extension.dart';
import 'package:ymgk_final_project/feature/home/cubit/home_state.dart';
import 'package:ymgk_final_project/feature/home/cubit/home_view_model.dart';
import 'package:ymgk_final_project/feature/home/view/widget/bar_chat_widget.dart';
import 'package:ymgk_final_project/feature/home/view/widget/bottom_text_form.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.init();
        viewmodel.setContext(context);
        context.read<HomeViewModel>().startGame();
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) => Scaffold(
        backgroundColor: ColorConstant.instance.background,
        body: context.watch<HomeViewModel>().state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: [SliverFillRemaining(hasScrollBody: false, child: buildBodyColumn(context, ColorConstant.instance.lineColor, viewModel))],
              ),
      ),
    );
  }

  Widget buildBodyColumn(BuildContext context, Color lineColor, HomeViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [buildInfoGameTextColumn(context, viewModel), const BarChartWidget(), buildBottomColumn(context, viewModel)],
    );
  }

  Widget buildInfoGameTextColumn(BuildContext context, HomeViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 50, bottom: 10),
          child: Center(
            child: Text("Süt Miktarları", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          ),
        ),
        BlocBuilder<HomeViewModel, HomeState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: context.lowValue, horizontal: context.lowValuePlus),
              child: Center(
                child: Text(
                    "Bir çiftçinin beş ineği var: Sultan, Benekli, Tosun, Şaşkın ve Garip. Çiftçi, her bir ineğin günde kaç ünite süt verdiğini göstermek için bir tablo çizer. Ne var ki ineklerin ismini tabloya yazmayı unutur. Tek hatırladığı Sultan'ın Tosun'dan ${state.subtraction} ünite fazla, Garip'in ise Benekli ile aynı miktarda süt verdiğidir.",
                    style: const TextStyle(letterSpacing: 0.5, height: 1.2)),
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.lowValuePlus, horizontal: context.lowValuePlus),
          child: Text(ApplicationConstant.instance.questionText, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget buildBottomColumn(BuildContext context, HomeViewModel viewModel) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: context.lowValuePlus, vertical: context.lowValue),
        decoration: BoxDecoration(
          color: ColorConstant.instance.grassBottoColor,
        ),
        child: Form(
          key: viewModel.formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 80,
                  height: 8,
                  decoration: BoxDecoration(color: Colors.white12.withOpacity(0.7), borderRadius: BorderRadius.circular(15)),
                ),
              ),
              buildBtnAnswer(context, viewModel),
              buildBottomColumnItems(viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBtnAnswer(BuildContext context, HomeViewModel viewModel) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          viewModel.onpressedResult(context);
        },
        child: Container(
          height: 45,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: const Center(child: Text("Sonuc", style: TextStyle(fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }

  Widget buildBottomColumnItems(HomeViewModel viewModel) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildBottomListItem("Sultan", viewModel.textFormList[0]),
            SizedBox(width: 100, height: 80, child: Image.asset(ImageConstant.instance.cow))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildBottomListItem("Tosun", viewModel.textFormList[1]),
            buildBottomListItem("Garip", viewModel.textFormList[2]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildBottomListItem("Benekli", viewModel.textFormList[3]),
            buildBottomListItem("Şaşkın", viewModel.textFormList[4]),
          ],
        ),
      ],
    );
  }

  Widget buildBottomListItem(String text, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Text(text), const SizedBox(width: 10), BottomTextFormField(controller: controller)],
    );
  }
}
