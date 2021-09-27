import 'package:car_order_system/car_order_system/color_theme.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final double topPadding;
  final double bottomPadding;

  const BottomButton({
    Key? key,
    this.onPressed,
    required this.title,
    required this.topPadding,
    required this.bottomPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 1250),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 160 * value),
          child: Opacity(opacity: 1 - value, child: child),
        );
      },
      tween: Tween(begin: 1.0, end: 0.0),
      curve: Curves.easeIn,
      child: Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.only(
            left: 70, right: 70, bottom: bottomPadding, top: topPadding),
        child: SizedBox.expand(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              primary: purpleColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
