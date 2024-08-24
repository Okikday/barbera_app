import 'package:flutter/material.dart';
import 'package:barbera_app/common/styles/colors.dart';
import 'package:barbera_app/common/styles/constants.dart';
import 'package:barbera_app/common/widgets/barber_specialists.dart';
import 'package:barbera_app/common/widgets/barbershop.dart';
import 'package:barbera_app/common/widgets/categories.dart';
import 'package:barbera_app/storage/data.dart';
import 'package:barbera_app/utils/device_utils.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = DeviceUtils.getScreenWidth(context);
    double screenHeight = DeviceUtils.getScreenHeight(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 24),
        child: SizedBox(
          width: screenWidth,
            child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.23,
              width: screenWidth,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: bgImage(screenWidth, screenHeight),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        //Issue? change to Container
                        width: screenWidth,
                        height: screenHeight * 0.25,
                        child: homeTopOverlay(),
                      )),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Column(
                children: [
                  //Categories
                  Categories(),
                  //Best Barbershops
                  Barbershop(
                    list: Data.bestBarbershop,
                    topic: "Best Barbershop",
                  ),
                  BarberSpecialists(list: Data.barberSpecialists),
                  Barbershop(
                    list: Data.popularBarbershop,
                    topic: "Popular Barbershop",
                  ),
                  Constants.whiteSpaceVertical(24),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget bgImage(double screenWidth, double screenHeight) {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
          Color.fromARGB(75, 0, 0, 0), BlendMode.colorBurn),
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.25,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/barbera/images/barbera_on_boarding_2.jpg"))),
      ),
    );
  }
}

Widget homeTopOverlay() {
  return Column(
    children: [
      Constants.whiteSpaceVertical(48),
      //The whole middle Row
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Left part of middle
          Row(
            children: [
              Constants.whiteSpaceHorizontal(16),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/barbera/images/alex.jpg"),
                  ),
                ),
              ),
              Constants.whiteSpaceHorizontal(12),
              Constants.wrapInBox(
                color: Colors.transparent,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Alex!",
                      style: TextStyle(
                          color: BarberaColor.white,
                          fontSize: Constants.medium),
                    ),
                    Text(
                      "Relax look great feel confident",
                      style: TextStyle(
                          color: BarberaColor.white,
                          fontSize: Constants.extraSmall),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //Right part of the middle
          Row(
            children: [
              Constants.wrapInBox(
                  Icon(
                    Icons.notifications_outlined,
                    size: 24,
                    color: BarberaColor.white,
                  ),
                  size: 36,
                  color: const Color.fromARGB(80, 255, 255, 255)),
              Constants.whiteSpaceHorizontal(16)
            ],
          )
        ],
      ),

      Constants.whiteSpaceVertical(32),

      Constants.wrapInPadding(
        left: 16,
        right: 16,
        Container(
          width: 400,
          height: 42,
          decoration: BoxDecoration(
              border: Border.all(
                color: BarberaColor.white,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Constants.whiteSpaceHorizontal(12),
              Icon(
                Icons.search,
                color: BarberaColor.white,
                size: 24,
              ),
              Constants.whiteSpaceHorizontal(12),
              Text(
                "Search for barbershop name",
                style: TextStyle(
                    color: BarberaColor.white, fontSize: Constants.small),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
