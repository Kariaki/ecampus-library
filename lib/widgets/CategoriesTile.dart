import 'package:flutter/material.dart';

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 250,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.indigo[900],
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 2,
                color: Colors.grey,
              )
            ]),
        child: const Center(
          child: Text(
            "Biographies",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
