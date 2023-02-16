import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'CarouseTile.dart';

class Carousel extends StatefulWidget {

  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
     return CarouselSlider.builder(
        carouselController: controller,
        options: CarouselOptions(
          height: 300,
          enableInfiniteScroll: true,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 1.2,
          pageSnapping: true,
          viewportFraction: 0.8,
        ),
        itemCount: 3,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => const CarouselTile(),
      );

  }
}
