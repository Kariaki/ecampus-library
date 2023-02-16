import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final icon;
  final String HintText;
  final color;
  final controller;
  final obscure;
  final onChanged;
  final type;
  final onSubmitted;
  String? value;

  CustomTextField(
      {Key? key,
      this.controller,
      this.color,
      required this.icon,
      required this.HintText,
      this.type,
      this.obscure,
      this.onChanged,
      this.onSubmitted,
      this.value,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        initialValue: value,
        onFieldSubmitted: onSubmitted,
        controller: controller,
        keyboardType: type,
        obscureText: obscure,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: color,
          ),
          hintText: HintText,
          hintStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          contentPadding: const EdgeInsets.only(top: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
