import 'package:flutter/material.dart';

class CustomStatsTile extends StatelessWidget {
  final String Score;
  final String Label;
  const CustomStatsTile({Key? key, required this.Label, required this.Score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.indigo[200],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Score, style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.white,
              ),),
              Text(Label, style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
