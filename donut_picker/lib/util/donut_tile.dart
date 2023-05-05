import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  const DonutTile({
    super.key,
    required this.donutName,
    required this.donutPrice,
    required this.donutColor,
    required this.imageName,
  });

  final double borderRadius = 8;

  final String donutName;
  final String donutPrice;
  final donutColor;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return donutName == ""
        ? Text("")
        : Padding(
            padding: EdgeInsets.all(borderRadius),
            child: Container(
                decoration: BoxDecoration(
                  color: donutColor[50],
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Column(
                  children: [
                    //price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: donutColor[100],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(borderRadius),
                              topRight: Radius.circular(borderRadius),
                            ),
                          ),
                          padding: EdgeInsets.all(borderRadius),
                          child: Text(
                            "\$" + donutPrice,
                            style: TextStyle(
                              color: donutColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //donut
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      child: Container(
                          height: 120,
                          width: 120,
                          child: Image.asset(imageName, fit: BoxFit.cover)),
                    ),

                    //name
                    Text(
                      donutName,
                      style: TextStyle(fontSize: 22),
                    ),

                    //icons
                    Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.info),
                          Icon(Icons.add_shopping_cart),
                        ],
                      ),
                    ),
                  ],
                )),
          );
  }
}
