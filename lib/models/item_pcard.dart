class ItemCardModel {
  String name;
  double price;
  int initialCount;
  ItemCardModel({
    required this.name,
    required this.price,
    this.initialCount = 1,
  });
}
