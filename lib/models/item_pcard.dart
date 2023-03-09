import 'package:flutter/cupertino.dart';

class ItemCardModel {
  String name;
  String description;
  String imageUrl;
  double price;
  int initialCount;
  final List<Color> bgi;
  ItemCardModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.initialCount = 1,
    required this.bgi,
  });
}
