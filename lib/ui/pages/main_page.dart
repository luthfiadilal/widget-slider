import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliderr_app/ui/widget/movie_box.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double currentPage = 0;
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.6);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> urls = [
      "https://m.media-amazon.com/images/I/71lADxngTWS._AC_SL1050_.jpg",
      "https://i.pinimg.com/564x/24/05/f5/2405f5d1220d45fef53df0bfe804e104.jpg",
      "https://i.pinimg.com/736x/31/12/1d/31121d2058a5aa4da918d4eca3aec39f.jpg",
      "https://i.pinimg.com/564x/46/d8/94/46d894d6a6a9b5b7f24dd61d3d411867.jpg",
      "https://i.pinimg.com/564x/9c/59/20/9c5920d5720d7ba34ebf02096d6cc94e.jpg",
      "https://i.pinimg.com/564x/0d/5f/16/0d5f16e60422bdc57c0451d9a586e302.jpg"
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('Page View'),
        ),
        body: PageView.builder(
            controller: pageController,
            itemCount: urls.length,
            itemBuilder: (context, index) {
              double difference = index - currentPage;
              if (difference < 0) {
                difference *= -1;
              }
              difference = min(1, difference);
              return Center(
                child: MovieBox(
                  url: urls[index],
                  scale: 1 - (difference * 0.3),
                ),
              );
            }));
  }
}
