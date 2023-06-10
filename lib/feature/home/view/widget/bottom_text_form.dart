import 'package:flutter/material.dart';

class BottomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  const BottomTextFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 80,
        height: 80,
        child: Center(
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.7), borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: "",
              ),
              textAlign: TextAlign.center,
              autofocus: false,
              validator: (value) => value!.isEmpty ? "" : null,
            ),
          ),
        ));
  }
}
