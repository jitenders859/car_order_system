import 'package:flutter/material.dart';

class AutoParts {
  final int? id;
  final String title;
  final List<AutoPart> parts;
  final Axis scrollDirection;
  final bool rotate;
  final GridType grid;
  final String productImage;

  AutoParts({
    this.id,
    required this.title,
    required this.parts,
    this.rotate = false,
    required this.grid,
    required this.productImage,
  }) : this.scrollDirection =
            grid == GridType.HorizontalTwo ? Axis.horizontal : Axis.vertical;

  static List<AutoParts> autoPartList() => [
        AutoParts(
          id: 1,
          title: "Select Chassis",
          productImage: "assets/car_bookings/chassis.png",
          grid: GridType.HorizontalTwo,
          parts: [
            AutoPart(
              partImage: "assets/car_bookings/chassis1.png",
              id: 1,
              price: 0.0,
              productImage: "assets/car_bookings/chassisfront1.png",
              title: "Standard",
            ),
            AutoPart(
              partImage: "assets/car_bookings/chassis2.png",
              id: 2,
              price: 1125.0,
              productImage: "assets/car_bookings/chassisfront2.png",
              title: "Deluxe",
            ),
            AutoPart(
              partImage: "assets/car_bookings/chassis1.png",
              id: 3,
              price: 5545.0,
              productImage: "assets/car_bookings/chassisfront1.png",
              title: "Super Deluxe",
            ),
            AutoPart(
              partImage: "assets/car_bookings/chassis2.png",
              id: 4,
              price: 65266.0,
              productImage: "assets/car_bookings/chassisfront2.png",
              title: "Ultra Delux",
            ),
          ],
        ),
        AutoParts(
          id: 2,
          title: "Select Rims",
          grid: GridType.VerticalThree,
          productImage: "assets/car_bookings/tyre.png",
          rotate: true,
          parts: [
            AutoPart(
              partImage: "assets/car_bookings/tyre1.png",
              id: 1,
              price: 0.0,
              productImage: "assets/car_bookings/tyrefront1.png",
              title: "Sypder Design",
            ),
            AutoPart(
              partImage: "assets/car_bookings/tyre2.png",
              id: 2,
              price: 2500.0,
              productImage: "assets/car_bookings/tyrefront2.png",
              title: "Macan Turbo",
            ),
            AutoPart(
              partImage: "assets/car_bookings/tyre3.png",
              id: 3,
              price: 4455.0,
              productImage: "assets/car_bookings/tyrefront1.png",
              title: "Macan Sport",
            ),
            AutoPart(
              partImage: "assets/car_bookings/tyre4.png",
              id: 4,
              price: 6325.0,
              productImage: "assets/car_bookings/tyrefront2.png",
              title: "Sport Rider",
            ),
          ],
        ),
        AutoParts(
          id: 3,
          title: "Select Engine",
          grid: GridType.VerticalTwo,
          productImage: "assets/car_bookings/engine.png",
          parts: [
            AutoPart(
              partImage: "assets/car_bookings/engine1.png",
              id: 1,
              price: 0.0,
              title: "Standard",
            ),
            AutoPart(
              partImage: "assets/car_bookings/engine2.png",
              id: 2,
              price: 2500.0,
              title: "Super Charged",
            ),
            AutoPart(
              partImage: "assets/car_bookings/engine3.png",
              id: 3,
              price: 6500.0,
              title: "Heavy Charged",
            ),
          ],
        ),
        AutoParts(
          id: 4,
          title: "Select Frame",
          grid: GridType.VerticalColumn,
          productImage: "assets/car_bookings/frame.png",
          parts: [
            AutoPart(
              partImage: "assets/car_bookings/frame1.png",
              productImage: "assets/car_bookings/framefront1.png",
              id: 1,
              price: 0.0,
              title: "Suv Frame",
            ),
            AutoPart(
              partImage: "assets/car_bookings/frame2.png",
              productImage: "assets/car_bookings/framefront2.png",
              id: 2,
              price: 0.0,
              title: "Sedan Frame",
            ),
          ],
        ),
        AutoParts(
          id: 5,
          title: "Select Color",
          grid: GridType.SingleColor,
          productImage: "assets/car_bookings/car.png",
          parts: [
            AutoPart(
              partImage: "assets/car_bookings/car1.png",
              productImage: "assets/car_bookings/carfront1.png",
              productColors: <String, Color>{
                "Noir": Colors.black87,
                "Blacknight": Colors.black.withOpacity(.96),
                "Mahogany": Colors.red[900]!,
              },
              productImages: [
                "assets/car_bookings/suvfront1.png",
                "assets/car_bookings/suvfront2.png",
                "assets/car_bookings/suvfront3.png",
              ],
              partImages: [
                "assets/car_bookings/suv1.png",
                "assets/car_bookings/suv2.png",
                "assets/car_bookings/suv3.png",
              ],
              id: 1,
              price: 0.0,
              title: "Sedan",
            ),
            AutoPart(
              partImage: "assets/car_bookings/suv1.png",
              productImage: "assets/car_bookings/suvfront1.png",
              id: 2,
              price: 0.0,
              productColors: <String, Color>{
                "Noir": Colors.black87,
                "Viper Yellow": Colors.yellow[600]!,
                "Blacknight": Colors.black.withOpacity(.96),
                "Frost": Colors.grey[50]!,
                "Mazda": Colors.orange[700]!,
              },
              productImages: [
                "assets/car_bookings/carfront1.png",
                "assets/car_bookings/carfront2.png",
                "assets/car_bookings/carfront3.png",
                "assets/car_bookings/carfront4.png",
                "assets/car_bookings/carfront5.png",
              ],
              partImages: [
                "assets/car_bookings/car1.png",
                "assets/car_bookings/car2.png",
                "assets/car_bookings/car3.png",
                "assets/car_bookings/car4.png",
                "assets/car_bookings/car5.png",
              ],
              title: "SUV",
            ),
          ],
        ),
        AutoParts(
          id: 6,
          title: "Select Seat",
          grid: GridType.VerticalThree,
          productImage: "assets/car_bookings/seat.png",
          parts: [
            AutoPart(
              partImage: "assets/car_bookings/seat1.png",
              productImage: "assets/car_bookings/carfront1.png",
              id: 1,
              price: 1530.0,
              title: "3D Moiler",
            ),
            AutoPart(
              partImage: "assets/car_bookings/seat2.png",
              productImage: "assets/car_bookings/carfront1.png",
              id: 2,
              price: 250.0,
              title: "Choclate Brown",
            ),
            AutoPart(
              partImage: "assets/car_bookings/seat3.png",
              productImage: "assets/car_bookings/carfront1.png",
              id: 3,
              price: 350.0,
              title: "Black White",
            ),
            AutoPart(
              partImage: "assets/car_bookings/seat4.png",
              productImage: "assets/car_bookings/carfront1.png",
              id: 4,
              price: 550.0,
              title: "Awesome White",
            ),
          ],
        ),
      ];
}

class AutoPart {
  final int id;
  final String partImage;
  final List<String>? partImages;
  final String? productImage;
  final List<String>? productImages;
  final Map<String, Color>? productColors;
  final String title;
  final double price;

  AutoPart({
    required this.id,
    required this.title,
    required this.price,
    required this.partImage,
    this.partImages,
    this.productImage,
    this.productImages,
    this.productColors,
  });
}

enum GridType {
  SingleColor,
  HorizontalTwo,
  VerticalThree,
  VerticalTwo,
  VerticalColumn
}
