import 'dart:math';

import 'package:car_order_system/car_order_system/car.dart';
import 'package:car_order_system/car_order_system/choose_car.dart';
import 'package:car_order_system/car_order_system/color_theme.dart';
import 'package:car_order_system/car_order_system/ui/bottom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CompanyCars extends StatefulWidget {
  @override
  _CompanyCarsState createState() => _CompanyCarsState();
}

class _CompanyCarsState extends State<CompanyCars> {
  final _carsController = ScrollController();

  Duration _duration = Duration(milliseconds: 300);

  double currentPage = 0.0;

  final random = Random();

  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          Container(
            height: 45,
            width: 45,
            child: Image.asset("assets/car_companies/bmw.png"),
          ),
          SizedBox(height: 24.0),
          TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 1100),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, 120 * value),
                child: Opacity(opacity: 1 - value, child: child),
              );
            },
            tween: Tween(begin: 1.0, end: 0.0),
            curve: Curves.easeIn,
            child: Text(
              "BMW".toUpperCase(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 25),
          TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 1250),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, 30 * value),
                child: Opacity(opacity: 1 - value, child: child),
              );
            },
            tween: Tween(begin: 1.0, end: 0.0),
            curve: Curves.easeIn,
            child: Text(
              "8 Series",
              style: TextStyle(
                  color: greyColor, fontSize: 12, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: double.infinity,
                child: TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 500),
                  builder: (context, value, child) {
                    return Transform.scale(scale: value, child: child);
                  },
                  curve: Cubic(0.68, -0.25, 0.565, 1.65),
                  tween: Tween(begin: 0.0, end: 1.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cars.length + 1,
                    controller: _carsController,
                    itemBuilder: (context, index) => carsItemBuilder(index),
                  ),
                ),
              ),
            ),
          ),
          BottomButton(
            bottomPadding: 40,
            topPadding: 0,
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                    pageBuilder: (context, animation, _) {
                      return FadeTransition(
                        opacity: animation,
                        child: ChooseCar(),
                      );
                    },
                    transitionDuration: Duration(milliseconds: 650)),
              );
            },
            title: "View All",
          ),
        ],
      ),
    );
  }

  carsItemBuilder(int index) {
    if (index == cars.length) {
      return SizedBox(
        width: 20.0,
      );
    }
    return Container(
      margin: EdgeInsets.only(
        left: 20,
      ),
      width: screenSize.width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: lightGrey,
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.all(15.0),
            child: Image.asset(cars[index].carImages[0]),
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "${cars[index].carName} Series",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            "${random.nextInt(12)} Cars",
            style: TextStyle(
                color: greyColor, fontSize: 14.0, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
