import 'package:before_after/before_after.dart';
import 'package:car_order_system/car_order_system/car.dart';
import 'package:car_order_system/car_order_system/color_theme.dart';
import 'package:car_order_system/car_order_system/models/auto_parts.dart';
import 'package:car_order_system/car_order_system/ui/custom_left_scroll_physics.dart';
import 'package:flutter/material.dart';

class CarOrderStystem extends StatefulWidget {
  final Car car;

  const CarOrderStystem({Key key, this.car}) : super(key: key);
  @override
  _CarOrderStystemState createState() => _CarOrderStystemState();
}

class _CarOrderStystemState extends State<CarOrderStystem> {
  final ScrollController _autoPartsController = ScrollController();

  final PageController _pageController = PageController(
    viewportFraction: 0.25,
  );

  Size screenSize;
  double _currentPage;

  String oldImage;
  String newImage;
  double priceIncrement = 0.0;

  Map<int, AutoPart> selectedParts = {};

  submitSelectedAutoPart(int selectedId, AutoPart selectedPart) {
    print("hello");
    setState(() {
      if (selectedParts.containsKey(selectedId)) {}
      priceIncrement = 0.0;
      selectedParts[selectedId] = selectedPart;
      selectedParts.forEach((i, value) {
        priceIncrement += value.price;
      });

      if (selectedPart.productImage != null) {
        oldImage = newImage;
        newImage = selectedPart.productImage;
      }
    });
  }

  _listener() {
    setState(() {
      _currentPage = _pageController.page;
    });
  }

  @override
  void initState() {
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: blackTextColor,
          onPressed: () {},
        ),
        actions: [
          Container(
            height: 30.0,
            width: 35.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: blackTextColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.camera_rounded,
              color: greyColor,
            ),
          ),
        ],
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 160.0,
              width: 300.0,
              alignment: Alignment.center,
              child: BeforeAfter(
                beforeImage: newImage != null
                    ? Image.asset(newImage)
                    : Container(
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "Start Build",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                afterImage: oldImage != null
                    ? Image.asset(oldImage)
                    : Container(
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "Start Build",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                thumbRadius: 0,
              ),
              // child: ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   physics: CustomLeftScrollPhysics(itemDimension: 300.0),
              //   itemBuilder: (context, index) => Container(
              //     height: double.infinity,
              //     width: 300.0,
              //     child: Image.asset(cars[index].carImages[0]),
              //   ),
              //   itemCount: cars.length,
              // ),
            ),
            Container(
              padding: EdgeInsets.all(35),
              alignment: Alignment.center,
              child: Row(
                children: [
                  CostBox(
                    title: "Base Cost",
                    price: "56,000",
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  CostBox(
                    title: "Equipment",
                    price: priceIncrement.toStringAsFixed(0),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  CostBox(
                    title: "Total",
                    price: "${(56000 + priceIncrement).toStringAsFixed(0)}",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: CarPartsPicker(
                  productCallback: (int selectedId, AutoPart selectedPart) {
                    submitSelectedAutoPart(selectedId, selectedPart);
                  },
                  selectedParts: selectedParts,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarPartsPicker extends StatefulWidget {
  final Map<int, AutoPart> selectedParts;
  final Function(int selectedId, AutoPart selectedPart) productCallback;

  const CarPartsPicker({
    Key key,
    this.productCallback,
    this.selectedParts,
  }) : super(key: key);
  @override
  _CarPartsPickerState createState() => _CarPartsPickerState();
}

class _CarPartsPickerState extends State<CarPartsPicker> {
  final PageController _pageController = PageController(viewportFraction: 0.25);
  final PageController _partsPageController =
      PageController(viewportFraction: 1);

  double _currentPage = 0.0;
  String currentPageTitle = "";
  Map<int, AutoPart> _selectedParts;

  List<AutoParts> _autoPartsList = AutoParts().autoPartList();

  _listener() {
    setState(() {
      _currentPage = _pageController.page;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('selected veru');
    _pageController.addListener(_listener);
    currentPageTitle = _autoPartsList[0].title;
  }

  @override
  void didUpdateWidget(covariant CarPartsPicker oldWidget) {
    print('selected veru');
    if (oldWidget.selectedParts != widget.selectedParts) {
      print('selected veru');
      setState(() {
        _selectedParts = widget.selectedParts;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: double.infinity,
          width: 65.0,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 7.0),
          decoration: BoxDecoration(
            color: blackTextColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: SizedBox.expand(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1;
                    if (_pageController.position.haveDimensions) {
                      value = _pageController.page - index;
                      value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                    }
                    return Center(
                      child: SizedBox(
                        height: Curves.easeInOut.transform(value) * 400,
                        width: Curves.easeInOut.transform(value) * 200,
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Image.asset(
                      _autoPartsList[index].productImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
              physics: CustomLeftScrollPhysics(itemDimension: 60.0),
              controller: _pageController,
              itemCount: _autoPartsList.length,
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  key: Key(currentPageTitle),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      currentPageTitle,
                      style: TextStyle(
                        color: blackTextColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return PageView.builder(
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          controller: _partsPageController,
                          itemBuilder: (context, index) {
                            AutoParts autoParts = _autoPartsList[index];
                            GridType gridType = _autoPartsList[index].grid;
                            double height = constraints.maxHeight;
                            double width = constraints.maxWidth;
                            double itemDimension = 0.0;
                            bool horizontal = false;
                            double padding = 0.0;
                            switch (gridType) {
                              case GridType.VerticalThree:
                                itemDimension = height / 3;
                                padding = 20.0;
                                break;
                              case GridType.VerticalTwo:
                                itemDimension = height / 2;
                                padding = 8.0;
                                break;
                              case GridType.VerticalColumn:
                                itemDimension = height / 2;
                                padding = 15.0;
                                break;
                              case GridType.SingleColor:
                                itemDimension = height;
                                break;
                              case GridType.HorizontalTwo:
                                itemDimension = width / 2;
                                horizontal = true;
                                break;
                              default:
                                itemDimension = height / 2;
                            }

                            return ListView.builder(
                              physics: CustomLeftScrollPhysics(
                                itemDimension: itemDimension,
                              ),
                              scrollDirection:
                                  horizontal ? Axis.horizontal : Axis.vertical,
                              reverse: false,
                              itemBuilder: (_, partIndex) {
                                AutoPart autoPart = autoParts.parts[partIndex];
                                return IntrinsicHeight(
                                  child: Container(
                                    width: horizontal
                                        ? itemDimension
                                        : double.infinity,
                                    height: horizontal
                                        ? double.infinity
                                        : itemDimension,
                                    alignment: Alignment.center,
                                    child: gridType != GridType.HorizontalTwo
                                        ? Padding(
                                            padding: EdgeInsets.all(padding),
                                            child: Row(
                                              children: [
                                                gridType !=
                                                        GridType.VerticalColumn
                                                    ? Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 30.0),
                                                        child: Image.asset(
                                                          autoPart.partImage,
                                                          fit: BoxFit.fitHeight,
                                                        ),
                                                      )
                                                    : Container(),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      gridType ==
                                                              GridType
                                                                  .VerticalColumn
                                                          ? Expanded(
                                                              child: Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                child:
                                                                    Image.asset(
                                                                  autoPart
                                                                      .partImage,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                      Text(
                                                        "${autoPart.title}",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          height: 1.2,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 7.0,
                                                      ),
                                                      Text(
                                                        "+ \$" +
                                                            autoPart.price
                                                                .toStringAsFixed(
                                                                    0),
                                                        style: TextStyle(
                                                          color: greyColor,
                                                          height: 1.2,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: SizedBox.expand(
                                                    child: Radio(
                                                      value: autoPart.id,
                                                      activeColor:
                                                          blackTextColor,
                                                      groupValue: widget
                                                              .selectedParts
                                                              .containsKey(
                                                                  autoParts.id)
                                                          ? widget
                                                              .selectedParts[
                                                                  autoParts.id]
                                                              .id
                                                          : autoPart.title,
                                                      onChanged:
                                                          (changedValue) async {
                                                        widget.productCallback(
                                                            autoParts.id,
                                                            autoPart);
                                                        await Future.delayed(
                                                          Duration(
                                                            milliseconds: 250,
                                                          ),
                                                        );
                                                        setState(
                                                          () {
                                                            _currentPage += 1.0;
                                                            if (_currentPage
                                                                    .toInt() <
                                                                _autoPartsList
                                                                    .length) {
                                                              currentPageTitle =
                                                                  _autoPartsList[
                                                                          _currentPage
                                                                              .toInt()]
                                                                      .title;
                                                              _pageController.animateToPage(
                                                                  _currentPage
                                                                      .toInt(),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          350),
                                                                  curve: Curves
                                                                      .easeIn);
                                                              _partsPageController.animateToPage(
                                                                  _currentPage
                                                                      .toInt(),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          350),
                                                                  curve: Curves
                                                                      .easeIn);
                                                            }
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 30.0,
                                                ),
                                              ],
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              Expanded(
                                                child: Image.asset(
                                                  autoPart.partImage,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12.0,
                                              ),
                                              Text(
                                                "${autoPart.title}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  height: 1.2,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7.0,
                                              ),
                                              Text(
                                                "+ \$" +
                                                    autoPart.price
                                                        .toStringAsFixed(0),
                                                style: TextStyle(
                                                  color: greyColor,
                                                  height: 1.2,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                              Container(
                                                height: 40,
                                                width: 40,
                                                child: SizedBox.expand(
                                                  child: Radio(
                                                    value: autoPart.id,
                                                    activeColor: blackTextColor,
                                                    groupValue: widget
                                                            .selectedParts
                                                            .containsKey(
                                                                autoParts.id)
                                                        ? widget
                                                            .selectedParts[
                                                                autoParts.id]
                                                            .id
                                                        : autoPart.title,
                                                    onChanged:
                                                        (changedValue) async {
                                                      widget.productCallback(
                                                          autoParts.id,
                                                          autoPart);
                                                      await Future.delayed(
                                                          Duration(
                                                              milliseconds:
                                                                  250));
                                                      setState(
                                                        () {
                                                          _currentPage += 1.0;

                                                          if (_currentPage
                                                                  .toInt() <
                                                              _autoPartsList
                                                                  .length) {
                                                            currentPageTitle =
                                                                _autoPartsList[
                                                                        _currentPage
                                                                            .toInt()]
                                                                    .title;
                                                            _pageController.animateToPage(
                                                                _currentPage
                                                                    .toInt(),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        350),
                                                                curve: Curves
                                                                    .easeIn);
                                                            _partsPageController
                                                                .animateToPage(
                                                                    _currentPage
                                                                        .toInt(),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            350),
                                                                    curve: Curves
                                                                        .easeIn);
                                                          }
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                            ],
                                          ),
                                  ),
                                );
                              },
                              itemCount: _autoPartsList[index].parts.length,
                            );
                          },
                          itemCount: _autoPartsList.length,
                          onPageChanged: (value) {},
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AutoPartsSelectWidget extends StatelessWidget {
  final double width;
  final double height;
  final AutoParts autoParts;
  final Function(AutoPart) onSelected;

  const AutoPartsSelectWidget(
      {Key key, this.width, this.height, this.autoParts, this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: autoParts.scrollDirection,
      itemBuilder: (context, index) => Container(),
      itemCount: autoParts.parts.length,
    );
  }
}

class CostBox extends StatelessWidget {
  final String title;
  final String price;
  final Color backgroundColor;
  final double dimension;

  const CostBox(
      {Key key, this.title, this.price, this.backgroundColor, this.dimension})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimension ?? 80.0,
      width: dimension ?? 80.0,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: this.backgroundColor ?? greyBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: greyColor,
              height: 1.3,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 7.0),
          Text(
            "\$$price",
            style: TextStyle(
              color: Colors.black,
              height: 1.3,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
