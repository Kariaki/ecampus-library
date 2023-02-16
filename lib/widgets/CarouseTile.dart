import 'package:flutter/material.dart';

class CarouselTile extends StatelessWidget {
  const CarouselTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 280,
          decoration: BoxDecoration(
            color: Colors.indigo[900],
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 5),
                spreadRadius: 4,
                color: Colors.grey,
              )
            ],
          ),
        ),

        // Spacing
        const SizedBox(
          height: 10,
        ),

        //  Title And Author
        Text("Travel To Japan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),

        // Spacing
        SizedBox(
          height: 5,
        ),

        Text(
          "John Underwood",
          style:
              TextStyle(fontWeight: FontWeight.w300, color: Colors.grey[500]),
        ),
      ],
    );
  }
}
