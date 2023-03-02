import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_shop/configs/colors.dart';
import 'package:flutter_app_shop/configs/styles.dart';

class ItemCardView extends StatefulWidget {
  final String itemName;
  final double itemPrice;
  const ItemCardView({super.key, required this.itemName, required this.itemPrice});

  @override
  State<ItemCardView> createState() => _ItemCardViewState();
}

class _ItemCardViewState extends State<ItemCardView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 270,
          decoration:
              BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(20)),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.itemName,
                    style: AppRegisterTextStyle.normalTextStyle1(weight: FontWeight.w600),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "\$${widget.itemPrice.toStringAsFixed(3)}",
                    style: AppRegisterTextStyle.lowTextStyle(
                        weight: FontWeight.w600, color: Colors.blueGrey.shade300),
                  ),
                ],
              ),
              Container(
                width: 35,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(tileMode: TileMode.clamp, colors: [
                      AppColors.primaryColor2.withOpacity(.85),
                      AppColors.primaryColor,
                    ]),
                    shape: BoxShape.circle),
                child: Icon(
                  CupertinoIcons.heart,
                  color: AppColors.colorWhite,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
