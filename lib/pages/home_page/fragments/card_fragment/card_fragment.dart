// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_app_shop/models/item_pcard.dart';
import 'package:flutter_app_shop/pages/home_page/fragments/card_fragment/widgets/item_card.dart';

class CardFragment extends StatefulWidget {
  const CardFragment({super.key});

  @override
  State<CardFragment> createState() => _CardFragmentState();
}

class _CardFragmentState extends State<CardFragment> {
  final List<ItemCardModel> items = [
    ItemCardModel(name: "Casual T-Shirt", price: 550),
    ItemCardModel(name: "Casual V-Neck", price: 121),
    ItemCardModel(name: "Casual H-Air", price: 84),
    ItemCardModel(name: "Casual Rockers", price: 182),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemCardWidget(
              itemName: item.name, itemPrice: item.price, initialCount: item.initialCount);
        },
      ),
    );
  }
}
