import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:sliderr_app/ui/styles/style.dart';

class MovieBox extends StatelessWidget {
  late final String url;
  late final double scale;

  MovieBox(this.url, {this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: parentStyle.clone()
        ..background.image(url: url, fit: BoxFit.cover)
        ..width(200 * scale)
        ..height(300 * scale),
    );
  }
}
