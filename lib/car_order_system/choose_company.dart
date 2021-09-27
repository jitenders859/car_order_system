import 'package:car_order_system/car_order_system/car.dart';
import 'package:car_order_system/car_order_system/color_theme.dart';
import 'package:car_order_system/car_order_system/company_cars.dart';
import 'package:car_order_system/car_order_system/ui/bottom_button.dart';
import 'package:flutter/material.dart';

class CarChooseCompany extends StatefulWidget {
  @override
  _CarChooseCompanyState createState() => _CarChooseCompanyState();
}

class _CarChooseCompanyState extends State<CarChooseCompany> {
  final _pageCarCompnayController =
      PageController(viewportFraction: 0.5, keepPage: false);

  Duration _duration = Duration(milliseconds: 300);

  double currentPage = 0.0;

  Widget _buildItemList(BuildContext context, int index) {
    if (index == carCompaniesLogo.length)
      return Center(
        child: CircularProgressIndicator(),
      );
    return Container(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.yellow,
            width: 150,
            height: 200,
            child: Center(
              child: Text(
                '${carCompaniesLogo[index]}',
                style: TextStyle(fontSize: 50.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _carCompanyScrollListener() {
    currentPage = _pageCarCompnayController.page!;
  }

  @override
  void initState() {
    super.initState();
    _pageCarCompnayController.addListener(_carCompanyScrollListener);
  }

  @override
  void dispose() {
    _pageCarCompnayController.removeListener(_carCompanyScrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
          ),
          TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 3000),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, 50 * value),
                child: Opacity(opacity: 1 - value, child: child),
              );
            },
            tween: Tween(begin: 1.0, end: 0.0),
            curve: Curves.easeIn,
            child: Text(
              "Carsio",
              style: TextStyle(
                  color: purpleColor,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 1100),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, 50 * value),
                child: Opacity(opacity: 1 - value, child: child),
              );
            },
            tween: Tween(begin: 1.0, end: 0.0),
            curve: Curves.easeIn,
            child: Text(
              "CHOOSE \nFAVORITE \nBRANDS".toUpperCase(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          ShaderMask(
            shaderCallback: (Rect availableSpace) {
              return LinearGradient(colors: [
                Colors.transparent,
                greyColor,
                greyColor,
                Colors.transparent
              ], stops: [
                0.05,
                0.3,
                0.65,
                0.95
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                  .createShader(availableSpace);
            },
            child: SizedBox(
              height: 30.0,
              child: TweenAnimationBuilder<double>(
                duration: Duration(milliseconds: 1250),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, 20 * value),
                    child: Opacity(opacity: 1 - value, child: child),
                  );
                },
                tween: Tween(begin: 1.0, end: 0.0),
                curve: Curves.easeIn,
                child: Text(
                  "Got your best deal",
                  style: TextStyle(
                      color: greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: double.infinity,
                height: 186,
                child: TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 2000),
                  builder: (context, value, child) {
                    return Transform.scale(scale: value, child: child);
                  },
                  curve: Interval(0.5, 1.0,
                      curve: Cubic(0.68, -0.25, 0.565, 1.65)),
                  tween: Tween(begin: 0.0, end: 1.0),
                  child: PageView.builder(
                    itemCount: carCompaniesLogo.length,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value.toDouble();
                      });
                    },
                    controller: _pageCarCompnayController,
                    itemBuilder: (context, index) => animateItemBuilder(index),
                  ),
                ),
              ),
            ),
          ),
          TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 1100),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, 30 * value),
                child: Opacity(opacity: 1 - value, child: child),
              );
            },
            tween: Tween(begin: 1.0, end: 0.0),
            curve: Curves.easeIn,
            child: Text(
              "Swipe right or left to see more",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          BottomButton(
            bottomPadding: 60,
            topPadding: 30,
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                    pageBuilder: (context, animation, _) {
                      return FadeTransition(
                        opacity: animation,
                        child: CompanyCars(),
                      );
                    },
                    transitionDuration: Duration(milliseconds: 650)),
              );
            },
            title: "Continue",
          ),
        ],
      ),
    );
  }

  animateItemBuilder(int index) {
    return AnimatedBuilder(
      animation: _pageCarCompnayController,
      builder: (context, child) {
        double value = 1;
        if (_pageCarCompnayController.position.haveDimensions) {
          value = _pageCarCompnayController.page! - index;
          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 200,
            width: Curves.easeInOut.transform(value) * 200,
            child: child,
          ),
        );
      },
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.circular(220),
              ),
              child: Container(
                margin: EdgeInsets.all(20),
                child: Image.asset(
                  carCompaniesLogo[index],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          currentPage == index
              ? Positioned(
                  top: 10.0,
                  right: 20.0,
                  child: TweenAnimationBuilder<double>(
                    duration: Duration(milliseconds: 500),
                    builder: (context, value, child) {
                      return Transform.scale(scale: value, child: child);
                    },
                    curve: Cubic(0.68, -0.55, 0.665, 1.55),
                    tween: Tween(begin: 0.0, end: 1.0),
                    child: Container(
                      height: 32.0,
                      width: 32.0,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 26.0,
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

class ShaderMaskContainer extends StatelessWidget {
  const ShaderMaskContainer(
      {Key? key, required this.child, required this.containerHeight})
      : super(key: key);

  final Widget child;
  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
