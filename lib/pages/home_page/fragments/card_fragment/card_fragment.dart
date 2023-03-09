// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_app_shop/configs/colors.dart';
import 'package:flutter_app_shop/configs/styles.dart';
import 'package:flutter_app_shop/models/item_pcard.dart';
import 'package:flutter_app_shop/pages/home_page/fragments/card_fragment/widgets/item_card.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class CardFragment extends StatefulWidget {
  const CardFragment({super.key});

  @override
  State<CardFragment> createState() => _CardFragmentState();
}

class _CardFragmentState extends State<CardFragment> {
  final List<ItemCardModel> items = [
    ItemCardModel(
        name: "Casual T-Shirt",
        description: "Women beauty",
        imageUrl: "assets/images/img2.png",
        price: 550,
        bgi: [
          Colors.blue.shade200,
          Colors.blue.shade300,
        ]),
    ItemCardModel(
        name: "Casual V-Neck",
        description: "Women beauty",
        imageUrl: "assets/images/img7.png",
        price: 121,
        bgi: [
          AppColors.primaryColor,
          AppColors.primaryColor2,
        ]),
    ItemCardModel(
        name: "Casual H-Air",
        description: "Women beauty",
        imageUrl: "assets/images/img3.png",
        price: 84,
        bgi: [
          AppColors.primaryColor,
          AppColors.primaryColor2,
        ]),
    ItemCardModel(
        name: "Casual Rockers",
        description: "Women beauty",
        imageUrl: "assets/images/img1.jpg",
        price: 182,
        bgi: [
          AppColors.primaryColor,
          AppColors.primaryColor2,
        ]),
    ItemCardModel(
        name: "Casual Rockers",
        description: "Women beauty",
        imageUrl: "assets/images/img1.jpg",
        price: 182,
        bgi: [
          AppColors.primaryColor,
          AppColors.primaryColor2,
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final item = items[index];
                return ItemCardWidget(
                    itemName: item.name,
                    itemDescription: item.description,
                    itemImagePreviewUrl: item.imageUrl,
                    itemPrice: item.price,
                    initialCount: item.initialCount,
                    bgi: item.bgi);
              },
            ),
          ),
          //const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 5),
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: AppRegisterTextStyle.normalTextStyle1(
                            color: AppColors.widgetInactiveColor, weight: FontWeight.w600),
                      ),
                      Text(
                        "\$1302",
                        style: AppRegisterTextStyle.largeTextStyle2(),
                      ),
                    ],
                  ),
                  const SizedBox(width: 35),
                  Expanded(
                      child: Bounce(
                    duration: const Duration(milliseconds: 150),
                    onPressed: () {
                      // Traitement...
                    },
                    child: Container(
                      height: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(1, 2),
                                color: AppColors.primaryColor.withOpacity(.35),
                                spreadRadius: 4,
                                blurRadius: 4)
                          ],
                          gradient: LinearGradient(colors: [
                            AppColors.primaryColor,
                            AppColors.primaryColor2,
                          ])),
                      child: Text(
                        "Buy Now",
                        style: AppRegisterTextStyle.largeTextStyle1(color: AppColors.colorWhite),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
