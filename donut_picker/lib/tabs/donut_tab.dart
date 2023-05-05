import 'package:flutter/material.dart';

import '../util/donut_tile.dart';

class DonutTab extends StatelessWidget {
  const DonutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //list of donuts
    List donutsOnSale = [
      //[donutName, donutPrice, donutColor,imageName]
      ["Chocolate", "3.50", Colors.brown, "images/donuts/donut_choco.png"],
      ["Strawberry", "3.80", Colors.red, "images/donuts/donut_strawberry.png"],
      ["Frosted", "4.00", Colors.pink, "images/donuts/donut_pink.png"],
      ["Matcha", "4.20", Colors.green, "images/donuts/donut_matcha.png"],
      ["Brulee", "6.78", Colors.purple, "images/donuts/donut_fancy.png"],
      ["Happy", "7.00", Colors.orange, "images/donuts/donut_happy.png"],
      ["Mask Up", "9.99", Colors.pink, "images/donuts/donut_covid.png"],
      ["", "", Colors.grey, "images/donuts/placeholder.png"],
    ];

    return GridView.builder(
        itemCount: donutsOnSale.length,
        padding: EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
        itemBuilder: (context, index) {
          return DonutTile(
            donutName: donutsOnSale[index][0],
            donutPrice: donutsOnSale[index][1],
            donutColor: donutsOnSale[index][2],
            imageName: donutsOnSale[index][3],
          );
        });
  }
}
