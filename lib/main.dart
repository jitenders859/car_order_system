import 'dart:math';

import 'package:car_order_system/car_order_system/3d_model.dart';
import 'package:car_order_system/car_order_system/car_order.dart';
import 'package:car_order_system/car_order_system/choose_company.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarChooseCompany(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<int> pages = List.generate(4, (index) => index);
  PageController controller = PageController(viewportFraction: 0.45);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: CustomLeftScrollPhysics(itemDimension: 250),
          itemCount: pages.length,
          itemBuilder: (context, index) => Container(
            height: 240,
            width: double.infinity,
            color: randomColor,
            margin: const EdgeInsets.only(right: 10),
          ),
        ),
      ),
    );
  }

  Color get randomColor =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
}

class CustomLeftScrollPhysics extends ScrollPhysics {
  final double itemDimension;

  CustomLeftScrollPhysics({this.itemDimension, ScrollPhysics parent})
      : super(parent: parent);

  @override
  CustomLeftScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomLeftScrollPhysics(
        itemDimension: itemDimension, parent: buildParent(ancestor));
  }

  double _getPage(ScrollPosition position, double portion) {
    return (position.pixels + portion) / itemDimension;
  }

  double _getPixels(double page, double portion) {
    return (page * itemDimension) - portion;
  }

  double _getTargetPixels(
    ScrollPosition position,
    Tolerance tolerance,
    double velocity,
    double portion,
  ) {
    double page = _getPage(position, portion);
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    return _getPixels(page.roundToDouble(), portion);
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);

    final Tolerance tolerance = this.tolerance;
    final portion = (position.extentInside - itemDimension) / 2;
    final double target =
        _getTargetPixels(position, tolerance, velocity, portion);
    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
