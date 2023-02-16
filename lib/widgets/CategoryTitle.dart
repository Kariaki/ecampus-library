import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  const CategoryTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Row(
            children: [const Text("see more"), Icon(Icons.chevron_right)],
          ),
        ],
      ),
    );
  }
}
