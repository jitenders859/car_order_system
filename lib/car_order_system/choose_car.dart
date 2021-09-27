import 'dart:math';

import 'package:car_order_system/car_order_system/car_order.dart';
import 'package:car_order_system/car_order_system/color_theme.dart';
import 'package:flutter/material.dart';

class ChooseCar extends StatefulWidget {
  @override
  _ChooseCarState createState() => _ChooseCarState();
}

class _ChooseCarState extends State<ChooseCar> {
  final random = Random(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(
                            width: 1.2,
                            color: backgroundColor,
                            style: BorderStyle.solid),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.menu,
                        size: 28.0,
                        color: blackTextColor,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      "Jimmy",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: 28.0,
                      width: 28.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: backgroundColor),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  "Choose your \nawesome car!",
                  style: TextStyle(
                    color: Colors.black,
                    height: 1.3,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ]..addAll(carList()),
      ),
    );
  }

  List<Widget> carList() {
    return List.generate(
        10,
        (index) => IntrinsicHeight(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, _) {
                          return FadeTransition(
                            opacity: animation,
                            child: CarOrderStystem(),
                          );
                        },
                        transitionDuration: Duration(milliseconds: 650)),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: backgroundColor,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/cars/bmw/${random.nextInt(24) + 1}.png",
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          "BMW 8 Series Couper",
                          style: TextStyle(
                            color: Colors.black,
                            height: 1.3,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 9.0),
                        Text(
                          "Start From \$202,305",
                          style: TextStyle(
                            color: greyColor,
                            height: 1.3,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
