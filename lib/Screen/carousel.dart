import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<String> imgList = [
    'https://www.supermarketperimeter.com/ext/resources/2023/09/28/AdobeStock_626708395.jpeg?t=1695926873&width=696',
    'https://cityfurnish.com/blog/wp-content/uploads/2023/08/healthy-positive-happy-woman-holding-paper-shopping-bag-full-fruit-vegetables-min.jpg',
    'https://a.storyblok.com/f/158954/6113x3968/f3e2759bda/4384f5_05a267a806fa466c8dcc213ecbc50d15_mv2.jpeg/m/2048x1329/filters:quality(75)',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxDbAZklFD4o4UuwNuPPps8Zx1s404E3rxdchwvAI18pnTRc3hOc6z08W5jGECPbtiGSI&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBuq0CULEoxWu_1ZiE6yALReEkEAuybxlnGw&s',
    'https://indian-retailer.s3.ap-south-1.amazonaws.com/s3fs-public/2024-07/Top%20Grocery%20Brands%20in%20India_0.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(autoPlay: true, height: 200.0),
      items: imgList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
                image: DecorationImage(image: NetworkImage(i), fit: BoxFit.cover),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
