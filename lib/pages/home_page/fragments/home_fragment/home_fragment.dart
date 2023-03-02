import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_shop/configs/colors.dart';
import 'package:flutter_app_shop/configs/styles.dart';
import 'package:flutter_app_shop/pages/home_page/fragments/home_fragment/widgets/item_card.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  final itemStringsChips = ["All", "Popular", "Recent", "Recommanded"];
  int chipCurrentIndex = 0;
  final searchItemController = TextEditingController();

  @override
  void initState() {
    chipCurrentIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    pageCotroller.dispose();
    searchItemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _searchbar(),
            _landingShop(),
            _userChipFecthItem(),
            //const Spacer(),
            _buildItemOrderContent()
          ],
        ),
      ),
    );
  }

  Widget _searchbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
                width: double.infinity,
                height: 55,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: const Offset(1, 2),
                      color: AppColors.widgetInactiveColor.withOpacity(.25),
                      spreadRadius: .5,
                      blurRadius: .5),
                ], borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.search,
                      color: AppColors.primaryColor2,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextFormField(
                        controller: searchItemController,
                        style: AppRegisterTextStyle.normalTextStyle1(),
                        decoration: InputDecoration(
                            hintText: "Search you item here...",
                            hintStyle: AppRegisterTextStyle.lowTextStyle(weight: FontWeight.w500),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              // Que faites-vous ?
            },
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(tileMode: TileMode.clamp, colors: [
                    AppColors.primaryColor,
                    AppColors.primaryColor2,
                  ]),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 2),
                        color: AppColors.widgetInactiveColor.withOpacity(.25),
                        spreadRadius: 1,
                        blurRadius: 1)
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                CupertinoIcons.slider_horizontal_3,
                color: AppColors.colorWhite,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _landingShop() {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
          gradient: LinearGradient(tileMode: TileMode.clamp, colors: [
            AppColors.primaryColor,
            AppColors.primaryColor2,
          ]),
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
    );
  }

  Widget _userChipFecthItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: SizedBox(
          height: 50,
          child: ListView.builder(
            itemCount: itemStringsChips.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: FilterChip(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
                    backgroundColor: Colors.blueGrey.shade50,
                    selected: chipCurrentIndex == index ? true : false,
                    selectedColor: AppColors.primaryColor,
                    showCheckmark: false,
                    labelStyle: AppRegisterTextStyle.normalTextStyle1(
                        color: AppColors.colorBlack.withOpacity(.65), weight: FontWeight.w600),
                    label: Text(
                      itemStringsChips[index],
                    ),
                    onSelected: (slt) {
                      setState(() {
                        chipCurrentIndex = index;
                        //pageCotroller.jumpToPage(chipCurrentIndex);
                        pageCotroller.animateToPage(chipCurrentIndex,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.linearToEaseOut);
                      });
                    }),
              );
            },
          )),
    );
  }

  /*
    Selon la maquette les informations(item => article), doivent etre afficher 2/2 en x et y,
    l'utilisation d'un listview levera une exception car un signlescrollview est deja utiliser,
    pour corriger le bug de rendu d'espace insuffisant de widget a l'ecran,
    Nous utiliserons donc une valeur definis a l'avance qui sera construit de facon a dessiner,
    le model d'article comme indiquer 
  */
  final pages = [
    GridView(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 330, crossAxisSpacing: 8),
      children: const [
        ItemCardView(itemName: "Casual V-Neck", itemPrice: 629.00),
        ItemCardView(itemName: "Casual T-Shirt", itemPrice: 70.00),
        ItemCardView(itemName: "Casual Rockers", itemPrice: 410.00),
        ItemCardView(itemName: "Casual H-Air", itemPrice: 129.00),
      ],
    ),
    GridView(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 330, crossAxisSpacing: 8),
      children: const [
        ItemCardView(itemName: "Casual V-Neck", itemPrice: 629.00),
        ItemCardView(itemName: "Casual T-Shirt", itemPrice: 70.00),
      ],
    ),
    GridView(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 330, crossAxisSpacing: 8),
      children: const [
        ItemCardView(itemName: "Casual V-Neck", itemPrice: 629.00),
      ],
    ),
    GridView(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 330, crossAxisSpacing: 8),
      children: const [
        ItemCardView(itemName: "Casual V-Neck", itemPrice: 629.00),
        ItemCardView(itemName: "Casual T-Shirt", itemPrice: 70.00),
      ],
    )
  ];
  final pageCotroller = PageController();
  Widget _buildItemOrderContent() {
    return SizedBox(
        height: MediaQuery.of(context).size.height - 150,
        child: PageView(
          controller: pageCotroller,
          onPageChanged: (index) {
            setState(() {
              chipCurrentIndex = index;
            });
          },
          physics: const BouncingScrollPhysics(),
          children: pages,
        ));
  }
}
