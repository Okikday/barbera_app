import 'package:flutter/material.dart';
import 'package:barbera_app/common/styles/constants.dart';
import 'package:barbera_app/utils/device_utils.dart';

class Barbershop extends StatelessWidget {
  final String topic;
  final List list;

  const Barbershop({
    super.key,
    required this.topic,
    required this.list,

    
  });
  //Barbershop name, location, rating, asset
 
  @override
  Widget build(BuildContext context) {
    double screenWidth = DeviceUtils.getScreenWidth(context);
    return SizedBox(
      width: screenWidth,
      child: Column(
        children: [
          Constants.whiteSpaceVertical(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Constants.wrapInPadding(
                  left: 16,
                  Text(
                    topic,
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: Constants.medium),
                  ),
                ),
              Constants.wrapInPadding(
                  Text(
                    "See all",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: Constants.small),
                  ),
                  right: 12
                  ),
            ],
          ),
          Constants.whiteSpaceVertical(8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < list.length; i++) 
                  BarbershopBox(barbershopName: list[i][0], description: list[i][1], rating: list[i][2], assetName: list[i][3], first: i == 0 ? true : false, last: i == list.length-1 ? true : false,),
                ],
              ),
            ),
          Constants.whiteSpaceVertical(12)
        ],
      ),
    );
  }
}

class BarbershopBox extends StatelessWidget {
  final String barbershopName;
  final String description;
  final double rating;
  final String assetName;
  final bool? first;
  final bool? last;
  const BarbershopBox({
    super.key,
    required this.barbershopName,
    required this.description,
    required this.rating,
    required this.assetName,
    this.first = false,
    this.last = false,
  });

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.fromLTRB(first == true ? 16 : 8, 8, last == true ? 12 : 8, 8),
        child: Constants.wrapInBox(
          radius: 18,
          innerPadding: 6,
          color: const Color.fromARGB(24, 247, 247, 247),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/barbera/images/$assetName"),
                ),
              ),
            ),
            Constants.whiteSpaceVertical(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(" $barbershopName", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                //Text(rating.toString()),
              ],
            ),
            Constants.whiteSpaceVertical(4),
            Text(
              " $description",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: Constants.extraSmall),
            ),
            Constants.whiteSpaceVertical(8),
          ],
        ),
            ),
      );
  }
}