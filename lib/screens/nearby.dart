import 'package:flutter/material.dart';
import 'package:barbera_app/common/styles/colors.dart';
import 'package:barbera_app/common/styles/constants.dart';
import 'package:barbera_app/common/widgets/barber_specialists.dart';
import 'package:barbera_app/common/widgets/barbershop.dart';
import 'package:barbera_app/storage/data.dart';
import 'package:barbera_app/utils/device_utils.dart';

class Nearby extends StatelessWidget {
  const Nearby({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = DeviceUtils.getScreenWidth(context);
    double screenHeight = DeviceUtils.getScreenHeight(context);
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Stack(
        children: [
          //Top
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.1,
                width: screenWidth,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Constants.wrapInPadding(
                  top: 24,
                  Row(
                    children: [
                      Expanded(
                        child: Constants.wrapInPadding(
                            Text(
                              "Hi Alex!",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: Constants.medium),
                              textAlign: TextAlign.center,
                            ),
                            left: 36),
                      ),
                      Constants.wrapInPadding(
                          Icon(
                            Icons.filter_alt,
                            color: BarberaColor.goldenRod,
                            size: 28,
                          ),
                          right: 12)
                    ],
                  ),
                ),
              )),

          Positioned(
            top: screenHeight * 0.1,
            left: 0,
            right: 0,
            child: SizedBox(
              height: screenHeight -
                  DeviceUtils.getBottomNavigatorBarHeight() -
                  (screenHeight * 0.1),
              width: screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Constants.wrapInPadding(
                      left: 16,
                      Text(
                        "Your Location",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: Constants.small),
                      ),
                    ),
                    Constants.whiteSpaceVertical(8),
                    topBarLocationPart(context),
                    Constants.whiteSpaceVertical(24),
                    //Search bar
                    searchBar(context),
                    Constants.whiteSpaceVertical(2),
                    BarberSpecialists(list: Data.barberSpecialists),
                    Constants.whiteSpaceVertical(2),
                    Barbershop(topic: "Nearest Barbershops", list: Data.bestBarbershop)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget topBarLocationPart(BuildContext context) {
  return Constants.wrapInPadding(
    left: 14,
    Row(
      //The row after your location
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: BarberaColor.goldenRod,
              size: 22,
            ),
            Constants.whiteSpaceHorizontal(4),
            Text(
              "San Francisco City",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Constants.smallPlus2),
            )
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.edit_square,
              color: BarberaColor.goldenRod,
              size: 18,
            ),
            Constants.whiteSpaceHorizontal(4),
            Text(
              "Change",
              style: TextStyle(
                  color: BarberaColor.goldenRod,
                  fontSize: Constants.extraSmall),
            ),
            Constants.whiteSpaceHorizontal(16),
          ],
        ),
      ],
    ),
  );
}

Widget searchBar(BuildContext context) {
  return Constants.wrapInPadding(
    left: 16,
    right: 16,
    Container(
      width: 400,
      height: 42,
      decoration: BoxDecoration(
        color: const Color.fromARGB(34, 214, 148, 41),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Constants.whiteSpaceHorizontal(12),
          Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
          Constants.whiteSpaceHorizontal(12),
          Text(
            "Search for barbershop name",
            style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: Constants.small),
          )
        ],
      ),
    ),
  );
}
//const Color.fromARGB(91, 176, 169, 179)