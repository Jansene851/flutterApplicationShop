// ignore_for_file: must_be_immutable
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_app_shop/configs/colors.dart';
import 'package:flutter_app_shop/configs/styles.dart';

@immutable
class ItemCardWidget extends StatefulWidget {
  final String itemName;
  double itemPrice;
  int initialCount;
  ItemCardWidget({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.initialCount,
  }) : super(key: key);

  @override
  State<ItemCardWidget> createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<ItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 115,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
      decoration:
          BoxDecoration(color: AppColors.colorWhite, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(tileMode: TileMode.clamp, colors: [
                  AppColors.primaryColor,
                  AppColors.primaryColor2,
                ]),
                borderRadius: BorderRadius.circular(12)),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Casual T-Shirt",
                          style: AppRegisterTextStyle.normalTextStyle1(weight: FontWeight.w600),
                        ),
                        Text(
                          "Women beauty",
                          style: AppRegisterTextStyle.lowTextStyle(
                              weight: FontWeight.w600, color: AppColors.widgetInactiveColor),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // remove item
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(tileMode: TileMode.clamp, colors: [
                              AppColors.primaryColor,
                              AppColors.primaryColor2,
                            ]),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "-",
                          style: AppRegisterTextStyle.largeTextStyle1(
                              color: AppColors.colorWhite, weight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.itemPrice.toString()}",
                      style: AppRegisterTextStyle.largeTextStyle1(weight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                widget.initialCount++;
                                widget.itemPrice *= widget.initialCount;
                              });
                            },
                            child: Text(
                              "+",
                              style: AppRegisterTextStyle.normalTextStyle2(weight: FontWeight.bold),
                            )),
                        Text(
                          widget.initialCount.toString(),
                          style: AppRegisterTextStyle.normalTextStyle2(weight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                widget.initialCount--;
                                if (widget.initialCount <= 1) {
                                  setState(() {
                                    widget.initialCount = 1;
                                    log("item value <= 0, that is logic");
                                  });
                                }
                              });
                            },
                            child: Text(
                              "-",
                              style: AppRegisterTextStyle.normalTextStyle2(weight: FontWeight.bold),
                            )),
                      ],
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
