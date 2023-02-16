import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final hint;
  final icon;
  final item;
  final validator;
  final onChanged;

  const Dropdown({Key? key, required this.hint, required this.icon, required this.item, required this.onChanged, required this.validator}) : super(key: key);

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
          ),
          hint: hint,
          icon: icon,
          items: item,
          validator: validator,
          onChanged: onChanged,
        ),
      ),
    );
  }
}


// genderItem
//     .map(
// (item) => DropdownMenuItem<String>(
// value: item,
// child: Text(
// item,
// style: const TextStyle(
// fontSize: 14,
// ),
// ),
// ),
// ).toList()