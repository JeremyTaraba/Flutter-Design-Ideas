import 'package:donut_picker/util/tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../tabs/burger_tab.dart';
import '../tabs/donut_tab.dart';
import '../tabs/drinks_tab.dart';
import '../tabs/pizza_tab.dart';
import '../tabs/sides_tab.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Widget> myTabs = [
    MyTabs(imagePath: "images/icons/icon_donut.png"),
    MyTabs(imagePath: "images/icons/icon_burger.png"),
    MyTabs(imagePath: "images/icons/icon_pizza.png"),
    MyTabs(imagePath: "images/icons/icon_fries.png"),
    MyTabs(imagePath: "images/icons/icon_soda.png"),
    // MyTabs(imagePath: "images/icons/icon_alcohol.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: IconButton(
              onPressed: () {
                print("pressed menu");
              },
              icon: Icon(
                Icons.menu,
                color: Colors.grey[800],
                size: 36,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: IconButton(
                onPressed: () {
                  print("Pressed Cart");
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey[800],
                  size: 36,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              color: CupertinoColors.lightBackgroundGray,
              child: Text(
                "Donut Shoppe",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36, fontFamily: "Pacifico"),
              ),
            ),
            TabBar(tabs: myTabs),
            Expanded(
                child: TabBarView(
              children: [
                //donut
                DonutTab(),
                //burger
                BurgerTab(),
                //pizza
                PizzaTab(),
                //sides
                SidesTab(),
                //drinks
                DrinksTab(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
