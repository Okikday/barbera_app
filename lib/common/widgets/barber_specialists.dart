import 'package:flutter/material.dart';
import 'package:barbera_app/common/styles/colors.dart';
import 'package:barbera_app/common/styles/constants.dart';
import 'package:barbera_app/utils/device_utils.dart';

class BarberSpecialists extends StatelessWidget {
  final String topic;
  final List list;
  final bool showAllOption;
  final Color? color;

  const BarberSpecialists({super.key, required this.list, this.topic = "Barber Specialists", this.showAllOption = true, this.color});
  //name, assetName

  @override
  Widget build(BuildContext context) {
    double screenWidth = DeviceUtils.getScreenWidth(context);
    return SizedBox(
      width: screenWidth,
      child: Column(
        children: [
          Constants.whiteSpaceVertical(24),
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
                    showAllOption ? "See all" : "",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: Constants.small),
                  ),
                  right: 12)
            ],
          ),
          Constants.whiteSpaceVertical(12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i = 0; i < list.length; i++)
                  BarberSpecialistBox(name: list[i][0], assetName: list[i][1], color: color,)
                ],
              ),
            ),
          Constants.whiteSpaceVertical(12)
        ],
      ),
    );
  }
}


class BarberSpecialistBox extends StatelessWidget {
  final String name;
  final String assetName;
  final Color? color;

  const BarberSpecialistBox ({
    super.key,
    this.name = "",
    this.assetName = "barbera_logo",
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Constants.wrapInPadding(
    Column(
      children: [
        Container(
          width: 64,
          height: 64,
          
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/barbera/images/$assetName"),),
            borderRadius: BorderRadius.circular(64),
            border: Border.all(color: color ?? BarberaColor.goldenRod, width: 3, )
          ),
        ),
        Constants.whiteSpaceVertical(8),
        Text(name, style: TextStyle(color: Theme.of(context).colorScheme.primary),),
      ],
    ),
    all: 12,
  );
  }
}