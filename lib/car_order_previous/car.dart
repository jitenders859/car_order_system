List<String> carCompaniesLogo = [
  "assets/car_companies/audi.png",
  "assets/car_companies/bentley.png",
  "assets/car_companies/bmw.png",
  // "assets/car_companies/ferari.png",
  "assets/car_companies/ford.png",
  // "assets/car_companies/honda.png",
  "assets/car_companies/jaguar.png",
  "assets/car_companies/kia.png",
  "assets/car_companies/mahindra.png",
  "assets/car_companies/mini.png",
  "assets/car_companies/nissan.png",
  "assets/car_companies/skoda.png",
  "assets/car_companies/tata.png",
  // "assets/car_companies/volkswagen.png",
  // "assets/car_companies/volvo.png",
];

List<CarSeries> cars = [
  CarSeries(
    carName: "BMW 2",
    carImages: [
      "assets/cars/bmw/2.png",
      "assets/cars/bmw_2/1.png",
      "assets/cars/bmw_2/2.png",
      "assets/cars/bmw_2/3.png",
      "assets/cars/bmw_2/4.png",
      "assets/cars/bmw_2/5.png",
      "assets/cars/bmw_2/6.png",
    ],
  ),
  CarSeries(
    carName: "BMW 3",
    carImages: [
      "assets/cars/bmw/3.png",
      "assets/cars/bmw_3/1.png",
      "assets/cars/bmw_3/2.png",
      "assets/cars/bmw_3/3.png",
      "assets/cars/bmw_3/4.png",
      "assets/cars/bmw_3/5.png",
      "assets/cars/bmw_3/6.png",
    ],
  ),
  CarSeries(
    carName: "BMW X1",
    carImages: [
      "assets/cars/bmw/4.png",
      "assets/cars/bmw_x1/1.png",
      "assets/cars/bmw_x1/2.png",
      "assets/cars/bmw_x1/3.png",
      "assets/cars/bmw_x1/4.png",
      "assets/cars/bmw_x1/5.png",
      "assets/cars/bmw_x1/6.png",
    ],
  ),
  CarSeries(
    carName: "BMW X4",
    carImages: [
      "assets/cars/bmw/5.png",
      "assets/cars/bmw_x4/1.png",
      "assets/cars/bmw_x4/2.png",
      "assets/cars/bmw_x4/3.png",
      "assets/cars/bmw_x4/4.png",
    ],
  ),
  CarSeries(
    carName: "BMW X7",
    carImages: [
      "assets/cars/bmw/6.png",
      "assets/cars/bmw_x7/1.png",
      "assets/cars/bmw_x7/2.png",
      "assets/cars/bmw_x7/3.png",
      "assets/cars/bmw_x7/4.png",
      "assets/cars/bmw_x7/5.png",
      "assets/cars/bmw_x7/6.png",
    ],
  ),
  CarSeries(
    carName: "BMW Z4",
    carImages: [
      "assets/cars/bmw/1.png",
      "assets/cars/bmw/2.png",
      "assets/cars/bmw/3.png",
      "assets/cars/bmw/4.png",
      "assets/cars/bmw/5.png",
      "assets/cars/bmw/6.png",
    ],
  ),
  CarSeries(
    carName: "BMW 6",
    carImages: [
      "assets/cars/bmw/13.png",
      "assets/cars/bmw/14.png",
      "assets/cars/bmw/15.png",
      "assets/cars/bmw/16.png",
      "assets/cars/bmw/17.png",
      "assets/cars/bmw/18.png",
    ],
  ),
  CarSeries(
    carName: "BMW 7",
    carImages: [
      "assets/cars/bmw/7.png",
      "assets/cars/bmw/8.png",
      "assets/cars/bmw/9.png",
      "assets/cars/bmw/10.png",
      "assets/cars/bmw/11.png",
      "assets/cars/bmw/12.png",
    ],
  ),
  CarSeries(
    carName: "BMW X5",
    carImages: [
      "assets/cars/bmw/19.png",
      "assets/cars/bmw/20.png",
      "assets/cars/bmw/21.png",
      "assets/cars/bmw/22.png",
      "assets/cars/bmw/23.png",
      "assets/cars/bmw/24.png",
    ],
  ),
];

class CarSeries {
  final String carName;
  final List<String> carImages;

  CarSeries({
    this.carName,
    this.carImages,
  });
}

class Car {
  final String carName;
  final String carModel;
  final String carPrice;
  final String carCompany;
  final String carImage;

  Car(this.carName, this.carModel, this.carPrice, this.carCompany,
      this.carImage);
}
