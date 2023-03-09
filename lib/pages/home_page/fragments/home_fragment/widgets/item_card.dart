import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_shop/configs/colors.dart';
import 'package:flutter_app_shop/configs/styles.dart';
import 'package:flutter_app_shop/pages/home_page/fragments/home_fragment/widgets/custom_appbar.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class ItemCardView extends StatefulWidget {
  final String itemName;
  final double itemPrice;
  final String itemPreviewPath;
  const ItemCardView(
      {super.key, required this.itemName, required this.itemPrice, required this.itemPreviewPath});

  @override
  State<ItemCardView> createState() => _ItemCardViewState();
}

class _ItemCardViewState extends State<ItemCardView> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Bounce(
          duration: const Duration(milliseconds: 150),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailPageViewerItem(
                    itemImgPath: widget.itemPreviewPath,
                    itemName: widget.itemName,
                    itemPrice: widget.itemPrice,
                    favStatus: favorite)));
          },
          child: Container(
            width: 200,
            height: 270,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(widget.itemPreviewPath), fit: BoxFit.cover),
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20)),
          ),
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
              Bounce(
                duration: const Duration(milliseconds: 150),
                onPressed: () {
                  setState(() {
                    favorite = !favorite;
                  });
                },
                child: Container(
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
                    favorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                    color: AppColors.colorWhite,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class DetailPageViewerItem extends StatefulWidget {
  final String itemImgPath;
  final String itemName;
  final double itemPrice;
  bool favStatus;
  DetailPageViewerItem(
      {super.key,
      required this.itemImgPath,
      required this.itemName,
      required this.itemPrice,
      required this.favStatus});

  @override
  State<DetailPageViewerItem> createState() => _DetailPageViewerItemState();
}

class _DetailPageViewerItemState extends State<DetailPageViewerItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomDetailItemAppbar(
              imgUrl: widget.itemImgPath,
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.itemName, style: AppRegisterTextStyle.largeTextStyle1()),
                      Text("\$${widget.itemPrice.toStringAsFixed(3)}",
                          style: AppRegisterTextStyle.largeTextStyle1()),
                    ],
                  ),
                  const SizedBox(height: 1),
                  Text(
                    "Women beauty rooms",
                    style: AppRegisterTextStyle.lowTextStyle(
                        color: AppColors.widgetInactiveColor, weight: FontWeight.w600),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Pink blazer with soft material, not hot confortable caying avaible in various size. Suitable for use at parties",
                      style: AppRegisterTextStyle.lowTextStyle(
                          color: AppColors.colorBlack.withOpacity(.70)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            Expanded(
                child: Bounce(
              duration: const Duration(milliseconds: 180),
              onPressed: () {},
              child: Container(
                height: 75,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      AppColors.primaryColor,
                      AppColors.primaryColor2,
                    ])),
                child: Text(
                  "Buy Now",
                  style: AppRegisterTextStyle.largeTextStyle1(color: AppColors.colorWhite),
                ),
              ),
            )),
            const SizedBox(width: 15),
            Bounce(
              duration: const Duration(milliseconds: 180),
              onPressed: () {},
              child: Container(
                width: 75,
                height: 75,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.grey.shade300, shape: BoxShape.circle),
                child: Icon(
                  CupertinoIcons.cart_fill,
                  color: AppColors.primaryColor2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
